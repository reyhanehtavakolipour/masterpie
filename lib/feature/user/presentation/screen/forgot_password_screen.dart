

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/user/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/helper_functions/helper_functions_design.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../bloc/forgot_password_bloc/state_event/forgot_password_state_event.dart';


class ForgotPasswordScreen extends StatefulWidget {



  const ForgotPasswordScreen({Key? key}) : super(key: key);

@override
State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}


class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>{

  final _emailController = TextEditingController();

  Color _emailBorderColor = DARK_PRIMARY_COLOR;


  late ForgotPasswordBloc  _forgotPasswordBloc;

  bool _emailSent = false;

  @override
  void initState() {
    super.initState();
    _emailSent = false;
    _forgotPasswordBloc = context.read<ForgotPasswordBloc>();
    _forgotPasswordBloc.add(const ForgotPasswordEvent.onReset());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(RESET_PASS_LABEL, style: TextStyle(color: Colors.white,),),
          backgroundColor: PRIMARY_COLOR,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
          ),
          actions: [

          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                buildEmailField(),

                const SizedBox(height: 20),

                buildResetPasswordButton(),

                const SizedBox(height: 28),


                BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                    builder: (mcontext, state) {
                      if (state is ForgotPasswordLoadingState) {
                        return const GFLoader(
                          type: GFLoaderType.circle,
                          loaderColorOne: DARK_PRIMARY_COLOR,
                          loaderColorTwo: DARK_PRIMARY_COLOR,
                          loaderColorThree: DARK_PRIMARY_COLOR,
                        );
                      }else if(state is ForgotPasswordLoadedState){
                        Future.delayed(Duration.zero,(){
                          _forgotPasswordBloc.add(const ForgotPasswordEvent.onReset());
                          setState(() {
                            _emailSent = true;
                          });
                        });
                      }else if(state is ForgotPasswordErrorState){
                        _forgotPasswordBloc.add(const ForgotPasswordEvent.onReset());
                        Future.delayed(Duration.zero,(){
                          setState(() {
                            _emailSent = false;
                          });
                          showErrorToast(context, state.message);
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
    );
  }


  Widget emailSentMessage(){
    return Visibility(
      visible: _emailSent,
        child: Container(
          color: LIGHT_GREY_COLOR,
          padding: const EdgeInsets.all(16),
          child: const Center(
            child: Text(FORGET_PASS_EMAIL_SENT_MSG, ),
          ),
        )
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





  Widget buildResetPasswordButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (){
          resetPasswordClickListener();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: MASTERPIE_YELLOW_COLOR
        ),
        child: const Text(REQUEST_RESET_PASSWORD_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.w600),),
      ),
    );
  }



  void resetPasswordClickListener(){

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


    _forgotPasswordBloc.add(
      ForgotPasswordEvent.onForgotPassword(_emailController.text,),
    );
  }

}



