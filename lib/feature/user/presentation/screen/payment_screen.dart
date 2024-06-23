
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:masterpie/feature/user/presentation/screen/model/new_plan_info_model.dart';
import 'package:masterpie/util/core/constant/hive_constants.dart';
import 'package:masterpie/util/design/helper_functions/helper_functions_design.dart';
import 'package:masterpie/util/design/toast/app_toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../util/core/constant/api_constant.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/helper.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/size/app_widget_size.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../data/local/datasource/user_hive_keyvalue_datasource.dart';
import 'dart:io' show Platform;



const List<String> _kProductIds = <String>[
  'premium.yearly.non.renewable'
];



class PaymentScreen extends StatefulWidget {


  final NewPlanInfo newPlanInfo;

  const PaymentScreen({super.key, required this.newPlanInfo});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}



class _PaymentScreenState extends State<PaymentScreen> {


  double _amount = 0;


  bool _loaderVisible= false;

  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<ProductDetails> _products = <ProductDetails>[];



  @override
  void initState() {
    initStoreInfo();
    super.initState();
    initPlanTypeOptions();
  }

  Future<void> initStoreInfo() async {

    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;
    _subscription =
        purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
          _listenToPurchaseUpdated(purchaseDetailsList);
        }, onDone: () {
          _subscription.cancel();
        }, onError: (Object error) {
          showErrorToast(context, ERROR_LABEL);
        });


    final ProductDetailsResponse productDetailResponse =
    await _inAppPurchase.queryProductDetails(_kProductIds.toSet());
    if(productDetailResponse.error == null){
      _products = productDetailResponse.productDetails;
    }
  }

  @override
  void dispose() {
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
      _inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(null);
    }
    _subscription.cancel();
    super.dispose();
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        if(mounted){
          setState(() {
            _loaderVisible= true;
          });
        }
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          showErrorToast(context, PAYMENT_FAILED_MSG);
          if(mounted){
            setState(() {
              _loaderVisible= false;
            });
          }
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
          await deliverProduct(purchaseDetails);
        }else{
          if(mounted){
            setState(() {
              _loaderVisible= false;
            });
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    }
  }

  Future<void> deliverProduct(PurchaseDetails purchaseDetails) async {
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    DateTime currentDate = DateTime.fromMillisecondsSinceEpoch(timestamp);

    String newNextUpdateDate = calculateNextDate(currentDate, 1, 'month').millisecondsSinceEpoch.toString();

    String endsAt = calculateNextDate(currentDate, 1, 'year').millisecondsSinceEpoch.toString();

    final updates = {
      'suggest_food_left_request' : widget.newPlanInfo.subscriptionPlans[1].suggestFoodRequestsLimit,
      'food_portion_left_request' : widget.newPlanInfo.subscriptionPlans[1].foodPortionRequestsLimit,
      'favorite_food_left' :  10000,
      'cook_book_left' : 10000,
      'next_update_date' : newNextUpdateDate,
      'current_period_end': endsAt,
      'plan_name' : PREMIUM_LABEL
    };

    final userHiveDataSource = serviceLocator<UserHiveDataSource>();
    String userId= await userHiveDataSource.getString(KEY_USER_ID);

    final supabase = Supabase.instance.client;

    final data = await supabase
        .from(USER_PLAN_TABLE)
        .update(updates)
        .eq('id', userId);


    setState(() {
      showSuccessToast(context, PAYMENT_SUCCEED_MSG);
      _loaderVisible= false;
      Navigator.pop(context);
    });
  }

  void initPlanTypeOptions(){
    _amount= widget.newPlanInfo.subscriptionPlans[1].prices[1];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(PAYMENT_LABEL, style: TextStyle(color: Colors.white,),),
            backgroundColor: PRIMARY_COLOR,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.white,),
            ),
            actions: [

            ],
          ),
          body: Stack(
            children: [
              Container(
                color: LIGHT_GREY_COLOR,
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [


                      const SizedBox(height: 12,),

                      Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(widget.newPlanInfo.subscriptionPlans[0].plan == BASIC_LABEL ? MEASURE_PATH : ACCURACY_PATH,
                            width: 60, height: 60, color: widget.newPlanInfo.subscriptionPlans[0].plan == BASIC_LABEL ? MASTERPIE_ORANGE_COLOR : GREEN_COLOR,)
                      ),


                      //plan name
                      Text(
                        '${widget.newPlanInfo.subscriptionPlans[0].plan.capitalize()} $PLAN_LABEL',
                        style: const TextStyle(
                          fontSize: 36,
                          color: DARK_PRIMARY_COLOR,
                        ),
                      ),



                      const SizedBox(height: 4,),


                      // description
                      Text(
                        (widget.newPlanInfo.subscriptionPlans[0].plan == BASIC_LABEL ? BASIC_GREAT_FOR_INFO : PREMIUM_GREAT_FOR_INFO).capitalize(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                        ),
                      ),


                      const SizedBox(height: 16,),


                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(BORDER_RADIUS,),
                          color: Colors.white,
                          border: Border.all(
                            color: DARK_PRIMARY_COLOR,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [


                            Text(
                              '${(_amount*12).toInt()}USD',
                              style: const TextStyle(
                                fontSize: 56,
                                color: Colors.green,
                              ),
                            ),


                            const Text(
                              FOR_ONE_YEAR_LABBEL,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.lightGreen,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),




                      const SizedBox(height: 36,),


                      const Text(
                        '$FEATURES_LABEL:',
                        style: TextStyle(
                            fontSize: 20,
                            color: MACRO_COLOR,
                            fontWeight: FontWeight.w400
                        ),
                      ),


                      const SizedBox(height: 16,),


                      //macro tracking
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 14.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: DARK_PRIMARY_COLOR, // Set the color of the dot icon
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: MACRO_TRACKING_ACCESS,
                                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),
                                ),
                              ],
                            ),
                          ),


                          const SizedBox(width: 8,),

                          const Icon(Icons.check, color: DARK_PRIMARY_COLOR, size: 18,)

                        ],
                      ),


                      //usda nutrition access
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 14.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: DARK_PRIMARY_COLOR, // Set the color of the dot icon
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: USDA_NUTRITION_ACCESS,
                                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),
                                ),
                              ],
                            ),
                          ),


                          const SizedBox(width: 8,),

                          const Icon(Icons.check, color: DARK_PRIMARY_COLOR, size: 18,)

                        ],
                      ),



                      //favorite food access
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 14.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: DARK_PRIMARY_COLOR, // Set the color of the dot icon
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: '$FAVORITE_FOOD_ACCESS:',
                                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 8,),

                          const Text(
                            UNLIMITED_LABEL,
                            style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),
                          ),

                        ],
                      ),


                      //cookbook food access
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [


                          RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 14.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: DARK_PRIMARY_COLOR, // Set the color of the dot icon
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: '$COOKBOOK_FOOD_ACCESS:',
                                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 8,),

                          const Text(
                            UNLIMITED_LABEL,
                            style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),
                          ),

                        ],
                      ),

                      //food portion
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 14.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: DARK_PRIMARY_COLOR, // Set the color of the dot icon
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: '$FOOD_PORTION_ACCESS:',
                                  style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 8,),

                          Text(
                            '${widget.newPlanInfo.subscriptionPlans[1].foodPortionRequestsLimit.toString()}/mo (${widget.newPlanInfo.subscriptionPlans[1].foodPortionRequestsLimit*12} yearly)',
                            style: const TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),
                          ),

                        ],
                      ),


                      const SizedBox(height: 48,),




                      buildPayButton(context),
                    ],
                  ),
                ),
              ),

              Visibility(
                visible: _loaderVisible,
                child: const GFLoader(
                  type: GFLoaderType.circle,
                  loaderColorOne: DARK_PRIMARY_COLOR,
                  loaderColorTwo: DARK_PRIMARY_COLOR,
                  loaderColorThree: DARK_PRIMARY_COLOR,
                ),
              )
            ],
          )
      ),
    );
  }


  Widget buildPayButton(BuildContext context){
    return ElevatedButton(
      onPressed:(){
        pay(context);
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: MASTERPIE_YELLOW_COLOR
      ),
      child: const Padding(
          padding: EdgeInsets.all(12),
          child: Text(PAY_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),)
      ),
    );
  }

  Future<void> pay(BuildContext context) async {
    if(_products.isEmpty){
      showErrorToast(context, ERROR_TRY_AGAIN);
      return;
    }

    late PurchaseParam purchaseParam;


    if (Platform.isAndroid) {
      purchaseParam = GooglePlayPurchaseParam(
          productDetails: _products[0],
          changeSubscriptionParam: null);
    } else {
      purchaseParam = PurchaseParam(
        productDetails: _products[0],
      );
    }

    if(await _inAppPurchase.isAvailable()){
      _inAppPurchase.buyNonConsumable(
          purchaseParam: purchaseParam);
    }
  }

}








