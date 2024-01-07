



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/user/presentation/screen/register_screen.dart';
import 'package:masterpie/feature/user/presentation/screen/signin_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
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
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Image.asset(LANDING_IMAGE_PATH, width: 500, height: 500,),


                        const Text(WELCOME_MASTERPIE_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w900, fontSize: 24),),

                        const SizedBox(height: 4,),

                        const Text(MOTTO_MASTERPIE_LABEL, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 11, fontStyle: FontStyle.italic),),

                        const SizedBox(height: 32,
                        ),



                        /// features
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 40,),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _featureTextWidget(CUSTOMIZABLE_FEATURE_LABEL),
                                  _featureTextWidget(PORTION_SUGGESTION_LABEL),
                                  _featureTextWidget(MACRO_TRACKING_LABEL),
                                ],
                              ),
                            ),

                            const SizedBox(width: 12,),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _featureTextWidget(INTERNATIONAL_MEAL_LABEL),
                                  _featureTextWidget(CREATE_FOOD_LABEL),
                                  _featureTextWidget(USER_FRIENDLY_LABEL),
                                ],
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                  )
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
                child: Center(
                  child: Row(
                    children: [


                      /// sign in button
                      Expanded(
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
                            backgroundColor: MASTERPIE_YELLOW_COLOR,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              SIGNIN_LABEL,
                              style: TextStyle(fontSize: 18.0, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),


                      const SizedBox(width: 16,),


                      /// register button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
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
                            padding: EdgeInsets.all(16),
                            child: Text(
                              REGISTER_LABEL,
                              style: TextStyle(fontSize: 18.0, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
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
        children: [
          const Icon(
            Icons.fiber_manual_record,
            size: 8.0,
            color: DARK_PRIMARY_COLOR,
          ),
          const SizedBox(width: 8.0),
          Text(
            featureText,
            style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }

}