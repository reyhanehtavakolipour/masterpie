



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/user/presentation/screen/profile_after_registration_screen.dart';
import 'package:masterpie/feature/user/presentation/screen/register_screen.dart';
import '../../../../main_screen.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../domain/model/user_credentials_model.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../bloc/login_bloc/state_event/login_state_event.dart';



class SignInScreen extends StatefulWidget {

  static const routeName = '/signin-screen';

  final UserCredentials? userCredentials;

  const SignInScreen({Key? key, this.userCredentials}) : super(key: key);

@override
State<SignInScreen> createState() => _SignInScreenState();
}


class _SignInScreenState extends State<SignInScreen>{

  bool _isPasswordVisible = false;

  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  late LoginBloc _loginBloc;


  Color _emailBorderColor = DARK_PRIMARY_COLOR;

  Color _passwordBorderColor = DARK_PRIMARY_COLOR;


  @override
  void initState() {
    super.initState();
    _loginBloc = context.read<LoginBloc>();
    _loginBloc.add(const LoginEvent.onReset());
    handleLoginRequestType();
  }


  void handleLoginRequestType(){
    if(widget.userCredentials != null){
      if(widget.userCredentials!.email.isNotEmpty && widget.userCredentials!.password.isNotEmpty){
        setState(() {
          _emailController.text = widget.userCredentials!.email;
        });
        _loginBloc.add(
          LoginEvent.onLoginWithCredential(widget.userCredentials!.email, widget.userCredentials!.password),
        );
      }else if(widget.userCredentials!.email.isNotEmpty){
        setState(() {
          _emailController.text = widget.userCredentials!.email;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(SIGNIN_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 36),),

                  const SizedBox(height: 64,),

                  buildEmailField(),
                  const SizedBox(height: 16),
                  buildPasswordField(),

                  const SizedBox(height: 48),
                  buildSignInButton(text: SIGNIN_LABEL),
                  const SizedBox(height: 16),
                  const Center(child: Text(OR_LABEL, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),)),
                  const SizedBox(height: 16),
                  buildGoogleSignInButton(),
                  const SizedBox(height: 20),
                  buildRegisterRow(),

                  const SizedBox(height: 18,),

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
                                builder: (context) => const ProfileAfterRegistrationScreen(),
                              ),
                            );
                          });
                        }else if(state is LoginErrorState){
                          Future.delayed(Duration.zero,(){
                            return showErrorToast(context, state.message);
                          });
                        }else{
                        }
                        return Container();
                      },
                      listener: (context, state){

                      }
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget buildRegisterRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(DONT_HAVE_AN_ACCOUNT),
        const SizedBox(width: 2,),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ),
            );
          },
          child: const Text(
            REGISTER_LABEL,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: DARK_PRIMARY_COLOR,
            ),
          ),
        ),
      ],
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
      ),
    );
  }


  Widget buildPasswordField() {
    return TextFormField(
      maxLines: 1,
      obscureText: !_isPasswordVisible,
      controller: _passwordController,
      decoration: InputDecoration(
        hintText: PASSWORD_LABEL,
        hintStyle: const TextStyle(fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border:  OutlineInputBorder(
          borderSide: BorderSide(color: _passwordBorderColor),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: _passwordBorderColor),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: _passwordBorderColor, width: 2),
        ),
        suffixIcon: IconButton(
          icon: Icon(
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

  Widget buildSignInButton({required String text}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (){
          signInWithCredentialClickListener();
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

  void signInrWithGoogleClickListener(){
    _loginBloc.add(
      const LoginEvent.onLoginWithGoogle(),
    );
  }

  void signInWithCredentialClickListener(){

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

    _passwordBorderColor = DARK_PRIMARY_COLOR;


    _loginBloc.add(
      LoginEvent.onLoginWithCredential(_emailController.text, _passwordController.text),
    );
  }


}