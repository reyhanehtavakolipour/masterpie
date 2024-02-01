import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../util/core/constant/api_constant.dart';
import '../util/core/di/service_locator.dart';

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
