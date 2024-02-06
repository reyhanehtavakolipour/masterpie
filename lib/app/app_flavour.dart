import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../firebase_options.dart';
import '../util/core/constant/api_constant.dart';
import '../util/core/constant/hive_constants.dart';
import '../util/core/di/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
        () async {
          WidgetsFlutterBinding.ensureInitialized();
          await FlutterConfig.loadEnvVariables();
          await setUpServiceLocator();
          await Hive.initFlutter();
          await initSupabase();
          await initHive();


          await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          );
          FlutterError.onError = (errorDetails) {
            FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
          };
          PlatformDispatcher.instance.onError = (error, stack) {
            FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
            return true;
          };



          runApp(await builder());
    },
        (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}


Future<void> initSupabase() async {
  final supabaseKey= await FlutterConfig.get(SUPABASE_COMPANY_URL);
  final anonKey= await FlutterConfig.get(SUPABSE_PUBLIC_ANON_KEY);
  await Supabase.initialize(
    url: supabaseKey,
    anonKey: anonKey,
  );
}


Future<void> initHive() async {
  AUTH_BOX= await FlutterConfig.get(AUTH_BOX);
  KEY_ORIGIN= await FlutterConfig.get(KEY_ORIGIN);
  KEY_USERNAME= await FlutterConfig.get(KEY_USERNAME);
  KEY_EMAIL= await FlutterConfig.get(KEY_EMAIL);
  KEY_PASSWORD= await FlutterConfig.get(KEY_PASSWORD);
  KEY_USER_ID= await FlutterConfig.get(KEY_USER_ID);
}
