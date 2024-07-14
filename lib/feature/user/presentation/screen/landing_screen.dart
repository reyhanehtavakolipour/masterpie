



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/user/presentation/screen/onboarding_screen.dart';
import 'package:masterpie/main_screen.dart';
import '../../../../util/core/constant/api_constant.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/text/app_assets.dart';
import '../bloc/get_user_credentials_bloc/get_user_credentials_bloc.dart';
import '../bloc/get_user_credentials_bloc/state_event/get_user_credentials_state_event.dart';



class LandingScreen extends StatefulWidget {

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
      // theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset(LANDING_IMAGE_PATH),

                  const SizedBox(height: 30,),

                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        DIET_WIZARD_TITLE_INTRO,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30,),


                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnBoardingScreen(isOnBoard: true,),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MASTERPIE_YELLOW_COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          GET_STARTED_LABEL,
                          style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 4,),

                  InkWell(
                    onTap: () => launchURL(FAT_SECRET_ATTRIBUTE),
                    child: const Text(
                      FAT_SECRET_LABEL,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}