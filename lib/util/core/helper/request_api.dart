
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../constant/api_constant.dart';
import '../constant/messages_constants.dart';


class NetworkRequest extends BaseRequest{

  static var request = NetworkRequest();

  static Future<NetworkRequest> create() async {
    request.updateDioInterceptors();
    await request.addHeaders();
    return request;
  }


  static Future<NetworkRequest> createGoogleCloud() async {
    request.updateDioInterceptors();
    await request.addGoogleCloudHeaders();
    return request;
  }


  static Future<NetworkRequest> createStripe() async {
    request.updateDioInterceptors();
    await request.addStripeHeaders();
    return request;
  }


  Future<void> addStripeHeaders() async{
    _dio.options.headers['Authorization'] = 'Bearer sk_test_51OUvYPFawMQyAsivVC0vyv3DHyPbhwbV7a5qU7DNJ930bPpLutVgYqi113gTYEBMmLIvfmxDZMwpwhxCRwnqP4zd00l24lcC8F';
    _dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';

  }

  static Future<NetworkRequest> createFoodDataCentral() async {
    request.updateDioInterceptors();
    return request;
  }

  Future<void> addHeaders() async{
    _dio.options.headers['Authorization'] = 'Bearer $SUPABSE_PUBLIC_ANON_KEY';

    _dio.options.headers['apikey'] = SUPABSE_PUBLIC_ANON_KEY;

  }

  Future<void> addGoogleCloudHeaders() async{
    _dio.options.headers['Authorization'] = 'Bearer $GOOGLE_CLOUD_KEY';
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
