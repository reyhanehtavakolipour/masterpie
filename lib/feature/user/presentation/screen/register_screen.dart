



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/user/presentation/screen/profile_after_registration_screen.dart';
import 'package:masterpie/feature/user/presentation/screen/signin_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../main_screen.dart';
import '../../../../util/core/constant/api_constant.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../bloc/login_bloc/state_event/login_state_event.dart';
import '../bloc/register_bloc/register_bloc.dart';
import '../bloc/register_bloc/state_event/register_state_event.dart';



class RegisterScreen extends StatefulWidget {



  const RegisterScreen({Key? key}) : super(key: key);

@override
State<RegisterScreen> createState() => _RegisterScreenState();
}


class _RegisterScreenState extends State<RegisterScreen>{

  bool _isPasswordVisible = false;


  late LoginBloc _loginBloc;

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();


  final _emailController = TextEditingController();

  late RegisterBloc _registerBloc;


  Color _emailBorderColor = DARK_PRIMARY_COLOR;


  Color _privacyCheckBoxBorderColor = DARK_PRIMARY_COLOR;


  Color _passwordBorderColor = DARK_PRIMARY_COLOR;

  Color _confirmPasswordBorderColor = DARK_PRIMARY_COLOR;

  bool _emailSent = false;


  bool _isPrivacyChecked= false;

  @override
  void initState() {
    super.initState();
    _emailSent = false;
    _registerBloc = context.read<RegisterBloc>();
    _registerBloc.add(const RegisterEvent.onReset());
    _loginBloc = context.read<LoginBloc>();
    _loginBloc.add(const LoginEvent.onReset());
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(REGISTER_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 36),),

                  const SizedBox(height: 64,),

                  buildEmailField(),
                  const SizedBox(height: 16),
                  buildPasswordField(hintText: PASSWORD_LABEL, controller: _passwordController, borderColor: _passwordBorderColor),
                  const SizedBox(height: 16),
                  buildPasswordField(hintText: CONFIRM_PASSWORD_LABEL, controller: _confirmPasswordController, borderColor: _confirmPasswordBorderColor),

                  const SizedBox(height: 20,),





                  privacyPolicyCheckBox(),


                  const SizedBox(height: 48),
                  buildRegisterButton(text: REGISTER_LABEL),


                  // const SizedBox(height: 16),
                  // const Center(child: Text(OR_LABEL, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),)),
                  // const SizedBox(height: 16),
                  // buildGoogleSignInButton(),
                  //
                  //
                  // const SizedBox(height: 20),
                  buildLoginRow(),

                  const SizedBox(height: 18),

                  BlocConsumer<RegisterBloc, RegisterState>(
                      builder: (mcontext, state) {
                        if (state is RegisterLoadingState) {
                          return const GFLoader(
                            type: GFLoaderType.circle,
                            loaderColorOne: DARK_PRIMARY_COLOR,
                            loaderColorTwo: DARK_PRIMARY_COLOR,
                            loaderColorThree: DARK_PRIMARY_COLOR,
                          );
                        }else if(state is RegisterLoadedState){
                          _registerBloc.add(const RegisterEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                            );
                          });
                        }else if(state is RegisterErrorState){
                          _registerBloc.add(const RegisterEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            // if(state.message == ERROR_CONFIRM_USER_SIGN_UP){
                            //   setState(() {
                            //     _emailSent = true;
                            //   });
                            //   return Container();
                            // }
                            return showErrorToast(context, state.message);
                          });
                        }else{
                        }
                        return Container();
                      },
                      listener: (context, state){

                      }
                  ),


                  BlocConsumer<LoginBloc, LoginState>(
                      builder: (mcontext, state) {
                        if (state is LoginLoadingState) {
                          return const GFLoader(
                            type: GFLoaderType.circle,
                            loaderColorOne: DARK_PRIMARY_COLOR,
                            loaderColorTwo: DARK_PRIMARY_COLOR,
                            loaderColorThree: DARK_PRIMARY_COLOR,
                          );
                        }else if(state is LoginLoadedState){
                          Future.delayed(Duration.zero,(){
                            _loginBloc.add(const LoginEvent.onReset());
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                            );
                          });
                        }else if(state is RegisterWithGoogleLoadedState){
                          _loginBloc.add(const LoginEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                            );
                          });
                        }else if(state is LoginErrorState){
                          _loginBloc.add(const LoginEvent.onReset());
                          Future.delayed(Duration.zero,(){
                            return showErrorToast(context, state.message);
                          });
                        }else{
                        }
                        return Container();
                      },
                      listener: (context, state){

                      }
                  ),


                  emailSentMessage()


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget buildLoginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(HAVE_AN_ACCOUNT),
        const SizedBox(width: 2,),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            );
          },
          child: const Text(
            SIGNIN_LABEL,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: DARK_PRIMARY_COLOR,
            ),
          ),
        ),
      ],
    );
  }


  Widget buildGoogleSignInButton() {
    return roundedGoogleContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            GOOGLE_PATH,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 10),
          const Text(SIGN_IN_WITH_GOOGLE, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
        ],
      ),
    );
  }

  void signInrWithGoogleClickListener(){
    _loginBloc.add(
      const LoginEvent.onLoginWithGoogle(),
    );
  }

  Widget roundedGoogleContainer({required Widget child}) {
    return ElevatedButton(
      onPressed: (){
        signInrWithGoogleClickListener();
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: DARK_PRIMARY_COLOR
      ),
      child: child,
    );
  }

  Widget buildEmailField() {
    return TextFormField(
      maxLines: 1,
      controller: _emailController,
      decoration:  InputDecoration(
        hintText: EMAIL_LABEL,
        hintStyle: const TextStyle(fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: _emailBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _emailBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _emailBorderColor, width: 2),
        ),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.info_outline,
            size: 18,
            color: DARK_PRIMARY_COLOR,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return PopScope(
                  onPopInvoked: (bool pop) async {

                  },
                  child: const AlertDialog(
                    title: Text(INFO_LABLE, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: DARK_PRIMARY_COLOR),),
                    content: Text(INFO_PRIVATE_EMAIL, style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: DARK_PRIMARY_COLOR)),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }


  Widget buildPasswordField({required String hintText, required TextEditingController controller, required Color borderColor}) {
    return TextFormField(
      maxLines: 1,
      obscureText: !_isPasswordVisible,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border:  OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            size: 18,
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: DARK_PRIMARY_COLOR,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
    );
  }



  Widget privacyPolicyCheckBox(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
          child: Checkbox(
            checkColor: Colors.white,
            side: BorderSide(color: _privacyCheckBoxBorderColor),
            activeColor: DARK_PRIMARY_COLOR,
            value: _isPrivacyChecked,
            onChanged: (newValue) {
              setState(() {
                _isPrivacyChecked = newValue!;
                _privacyCheckBoxBorderColor= DARK_PRIMARY_COLOR;
              });
            },
          ),
        ),

         const SizedBox(width: 12,),
          Expanded(
           child: GestureDetector(
             onTap: (){
               showPrivacy();
             },
             child: const Text(
              PRIVACY_AGREEMENT_CHECKBOX_MSG,
              style: TextStyle(fontSize: 13.0, color: DARK_PRIMARY_COLOR,
                decoration: TextDecoration.underline,
              ),
             ),
           ),
         ),
      ],
    );
  }


  void showPrivacy() async{
    final Uri url = Uri.parse(PRIVACY_MASTERPIE);
    await launchUrl(url);
  }



  Widget buildRegisterButton({required String text}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (){
          registerWithCredentialClickListener();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: MASTERPIE_YELLOW_COLOR
        ),
        child: Text(text, style: const TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),),
      ),
    );
  }

  void registerWithCredentialClickListener(){

    FocusScope.of(context).unfocus();


    ///empty email
    if(_emailController.text.isEmpty){
      setState(() {
        _emailBorderColor = Colors.red;
      });
      return;
    }

    /// invalid email
    if(!isValidEmail(_emailController.text)){
      showErrorToast(context, INVALID_EMAIL_ERROR);
      setState(() {
        _emailBorderColor = Colors.red;
      });
      return;
    }

    _emailBorderColor = DARK_PRIMARY_COLOR;


    /// empty password
    if(_passwordController.text.isEmpty){
      setState(() {
        _passwordBorderColor = Colors.red;
      });
      return;
    }

    /// invalid password
    if(!isValidPassword(_passwordController.text)){
      showErrorToast(context, INVALID_PASSWORD_ERROR);
      setState(() {
        _passwordBorderColor = Colors.red;
      });
      return;
    }

    _passwordBorderColor = DARK_PRIMARY_COLOR;


    /// empty confirm password
    if(_confirmPasswordController.text.isEmpty){
      setState(() {
        _confirmPasswordBorderColor = Colors.red;
      });
      return;
    }

    _confirmPasswordBorderColor = DARK_PRIMARY_COLOR;


    /// passwords don't match
    if(_confirmPasswordController.text != _passwordController.text){
      showErrorToast(context, PASSWORDS_NOT_MATCH_ERROR);
      setState(() {
        _confirmPasswordBorderColor = Colors.red;
        _passwordBorderColor = Colors.red;
      });
      return;
    }


    ///privacy not agreed
    if(!_isPrivacyChecked){
      setState(() {
        _privacyCheckBoxBorderColor = Colors.red;
      });
      return;
    }


    logEvent(REGISTER_BTN_CLICKED, null);

    _registerBloc.add(
      RegisterEvent.onRegisterWithCredential(_emailController.text, _passwordController.text),
    );

    setState(() {
      _emailSent = false;
    });

  }

  Widget emailSentMessage(){
    return Visibility(
        visible: _emailSent,
        child: Container(
          color: LIGHT_GREY_COLOR,
          padding: const EdgeInsets.all(16),
          child: const Center(
            child: Text(ERROR_CONFIRM_USER_SIGN_UP, ),
          ),
        )
    );
  }

}



