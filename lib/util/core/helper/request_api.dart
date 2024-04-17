
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';
import '../constant/api_constant.dart';
import '../constant/messages_constants.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import '../response/failure.dart';



Future<Either<Failure, oauth2.Client>> authFatSecret() async{

  final authorizationEndpoint = Uri.parse(FAT_SECRET_AUTH_URL);
  final identifier= await FlutterConfig.get(FAT_SECRET_IDENTIFIER);
  final secret= await FlutterConfig.get(FAT_SECRET_SECRET_KEY);
  final scopes = ['premier', 'barcode'];

  try {
    final client = await oauth2.clientCredentialsGrant(
        authorizationEndpoint,
        identifier,
        secret,
        scopes: scopes
    );

    if (client.credentials.isExpired) {
      await client.refreshCredentials();
      print('Token refreshed successfully!');
    }

    return Right(client);

  } catch (e) {
    print('Failed to authenticate: $e');
    return const Left(FailureResponse('oauth2 failed'));
  }
}



class NetworkRequest extends BaseRequest{

  static var request = NetworkRequest();

  static Future<NetworkRequest> create() async {
    request.updateDioInterceptors();
    await request.addHeaders();
    return request;
  }

  static Future<NetworkRequest> createFatSecret(String token) async {
    request.updateDioInterceptors();
    await request.addFatSecretHeaders(token);
    return request;
  }

  static Future<NetworkRequest> createGoogleCloud() async {
    request.updateDioInterceptors();
    await request.addGoogleCloudHeaders();
    return request;
  }

  static Future<NetworkRequest> createFoodDataCentral() async {
    request.updateDioInterceptors();
    return request;
  }

  Future<void> addHeaders() async{
    final anonKey= await FlutterConfig.get(SUPABSE_PUBLIC_ANON_KEY);
    _dio.options.headers['Authorization'] = 'Bearer $anonKey';

    _dio.options.headers['apikey'] = anonKey;

  }

  Future<void> addFatSecretHeaders(String token) async{
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<void> addGoogleCloudHeaders() async{
    final cloudKey= await FlutterConfig.get(GOOGLE_CLOUD_KEY);
    _dio.options.headers['Authorization'] = 'Bearer $cloudKey';
  }
}


class BaseRequest {
  final Dio _dio = Dio();

  BaseRequest() {
    updateDioInterceptors();
  }


  void updateDioInterceptors() {
    _dio.options = BaseOptions(
      baseUrl: BASE_URL,
      receiveDataWhenStatusError: true,
      connectTimeout: API_REQUEST_TIMEOUT,
      receiveTimeout: API_REQUEST_TIMEOUT,
      validateStatus: (value) {
        return value! <= 500;
      },
      headers: {
        'Accept': 'application/json',
      },
    );
    _dio
      ..interceptors.add(
        LogInterceptor(
          requestBody: kDebugMode ? true : false,
          responseBody: kDebugMode ? true : false,
          requestHeader: kDebugMode ? true : false,
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (DioError e, handler) {
            if(e.message.contains(SOCKET_EXCEPTION)){
              final error =  DioError(
                error: ERROR_INTERNET_CONNECTION,
                requestOptions: RequestOptions(
                    path: ''
                ),
              );
              return handler.next(error);
            }
            return handler.next(e);
          },
        ),
      );
  }

  // requests
  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    return await _dio.get(path, queryParameters: query);
  }

  Future<Response> post(String path, {Object? data}) async {
    return await _dio.post(path, data: data);
  }

  Future<Response> postParams(String path, {Map<String, dynamic>? params}) async {
    return await _dio.post(path, queryParameters: params);
  }

  Future<Response> getWithQueries(String path, Map<String, dynamic> queryParams) async {
    return await _dio.get(path, queryParameters: queryParams);
  }

}


String generateRandomId() {
  const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();

  return String.fromCharCodes(Iterable.generate(
    8, (_) => characters.codeUnitAt(random.nextInt(characters.length)),
  ));
}
