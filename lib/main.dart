import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:masterpie/util/core/constant/api_constant.dart';
import 'package:masterpie/util/core/di/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/app.dart';
import 'app/app_flavour.dart';

void main() async{
  init();
  bootstrap(() => App());
}

void init() async{
  await setUpServiceLocator();
  await Hive.initFlutter();
  await initSupabase();
  await initStripe();
}

Future<void> initStripe() async{
  Stripe.publishableKey = STRIPE_PUBLISHABLE_KEY;
  Stripe.merchantIdentifier = 'merchant.com.masterpieapp';
  await Stripe.instance.applySettings();
}


Future<void> initSupabase() async {
  await Supabase.initialize(
    url: SUPABASE_COMPANY_URL,
    anonKey: SUPABSE_PUBLIC_ANON_KEY,
  );
}
