



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/user/presentation/screen/signin_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../util/core/constant/api_constant.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../domain/model/user_credentials_model.dart';
import '../bloc/get_user_credentials_bloc/get_user_credentials_bloc.dart';
import '../bloc/get_user_credentials_bloc/state_event/get_user_credentials_state_event.dart';



class LandingScreen extends StatefulWidget {

  static const routeName = '/';


  const LandingScreen({Key? key}) : super(key: key);

@override
State<LandingScreen> createState() => _LandingScreenState();
}


class _LandingScreenState extends State<LandingScreen>{

  late GetUserCredentialsBloc _getUserCredentialsBloc;


  @override
  void initState() {
    super.initState();
    _getUserCredentialsBloc = context.read<GetUserCredentialsBloc>();
    getUserCredentials();
  }


  void getUserCredentials(){
    _getUserCredentialsBloc.add(
      const GetUserCredentialsEvent.onGetUserCredential()
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset(LANDING_IMAGE_PATH),

                  const SizedBox(height: 32,),

                  const Text(WELCOME_MASTERPIE_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w900, fontSize: 24),),

                  const SizedBox(height: 4,),

                  InkWell(
                    onTap: () => launchURL(FAT_SECRET_ATTRIBUTE),
                    child: const Text(
                      FAT_SECRET_LABEL,
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),



                  /// features
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            _featureTextWidget(CUSTOMIZABLE_FEATURE_LABEL),
                            _featureTextWidget(PORTION_SUGGESTION_LABEL),
                          ],
                        ),
                      ),


                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _featureTextWidget(CREATE_FOOD_LABEL),
                            _featureTextWidget(MACRO_TRACKING_LABEL),

                          ],



                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 32,),


                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PRIMARY_COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          GET_STARTED_LABEL,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  BlocConsumer<GetUserCredentialsBloc, GetUserCredentialsState>(
                      builder: (mcontext, state) {
                        if(state is GetUserCredentialsLoadedState){
                          Future.delayed(Duration.zero,(){
                            handleNavigation(state.userCredentials);
                          });
                        }else{
                        }
                        return Container();
                      },
                      listener: (context, state){

                      }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  void handleNavigation(UserCredentials userCredentials){
    if(userCredentials.email.isNotEmpty){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(userCredentials: userCredentials,),
        ),
      );
    }
  }



  Widget _featureTextWidget(String featureText) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.fiber_manual_record,
            size: 8.0,
            color: DARK_PRIMARY_COLOR,
          ),
          const SizedBox(width: 2.0),
          Text(
            featureText,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }

}