import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:masterpie/feature/user/presentation/screen/signin_screen.dart';

import '../../../../util/core/constant/messages_constants.dart';
import '../../../../util/design/color/app_colors.dart';
import '../../../../util/design/text/app_assets.dart';
import '../../../../util/design/toast/app_toast.dart';
import '../../domain/model/profile_model.dart';
import '../bloc/get_profile_bloc/get_profile_bloc.dart';
import '../bloc/get_profile_bloc/state_event/get_profile_state_event.dart';
import '../bloc/update_profile_bloc/state_evnt/update_profile_state_event.dart';
import '../bloc/update_profile_bloc/update_profile_bloc.dart';

class UserInfoScreen extends StatefulWidget {


  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {


  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _emailController = TextEditingController();

  late GetProfileBloc _getProfileBloc;
  late UpdateProfileBloc _updateProfileBloc;


  @override
  void initState() {
    super.initState();
    _getProfileBloc = context.read<GetProfileBloc>();
    _updateProfileBloc = context.read<UpdateProfileBloc>();
    getProfile();
  }


  void getProfile(){
    _getProfileBloc.add(const GetProfileEvent.onGetProfile());
  }


  void updateProfile(){
    _updateProfileBloc.add(
        UpdateProfileEvent.onUpdateUserInfo(
          _firstNameController.text,
          _lastNameController.text,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: MONTSERRAT_FONT),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(PROFILE_LABEL, style: TextStyle(color: Colors.white,),),
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
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [


                  const SizedBox(height: 32,),

                  /// Email Address
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: buildNameTextField(
                        hintText: 'email',
                        initialValue: '',
                        isEditable: false,
                        controller: _emailController
                    ),
                  ),


                  const SizedBox(height: 30.0),


                  /// First and Last Name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: buildNameTextField(hintText: FIRST_NAME_LABEL, controller: _firstNameController),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: buildNameTextField(hintText: LAST_NAME_LABEL, controller: _lastNameController),
                        ),
                      ],
                    ),
                  ),


                  const SizedBox(height: 64,),

                  buildSaveButton(),

                  const SizedBox(height: 16,),

                  buildDeleteAccountButton()

                ],
              ),

              BlocConsumer<GetProfileBloc, GetProfileState>(
                  builder: (mcontext, state) {
                    if (state is GetProfileLoadingState) {
                      return const GFLoader(
                        type: GFLoaderType.circle,
                        loaderColorOne: DARK_PRIMARY_COLOR,
                        loaderColorTwo: DARK_PRIMARY_COLOR,
                        loaderColorThree: DARK_PRIMARY_COLOR,
                      );
                    }else if(state is GetProfileLoadedState){
                      Future.delayed(Duration.zero,(){
                        fulfillWidgets(state.profile);
                      });
                    }else if(state is GetProfileErrorState){
                      _getProfileBloc.add(const GetProfileEvent.onReset());
                      Future.delayed(Duration.zero,(){
                        return showErrorToast(context, state.message);
                      });
                    }else if(state is ProfileDeletedState){
                      _getProfileBloc.add(const GetProfileEvent.onReset());
                      Future.delayed(Duration.zero,(){
                        showSuccessToast(context, DELETE_ACCOUNT_SUCCESS_MSG);
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ), (route) => false);
                      });
                    }else{
                    }
                    return Container();
                  },
                  listener: (context, state){

                  }
              ),

              BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
                  builder: (mcontext, state) {
                    if (state is UpdateProfileLoadingState) {
                      return const GFLoader(
                        type: GFLoaderType.circle,
                        loaderColorOne: DARK_PRIMARY_COLOR,
                        loaderColorTwo: DARK_PRIMARY_COLOR,
                        loaderColorThree: DARK_PRIMARY_COLOR,
                      );
                    }else if(state is UserInfoUpdatedState){
                      Future.delayed(Duration.zero,(){
                        setState(() {
                          showSuccessToast(context, PROFILE_UPDATED_MSG);
                          _updateProfileBloc.add(const UpdateProfileEvent.onReset());
                        });
                      });
                    }else if(state is UpdateProfileErrorState){
                      _updateProfileBloc.add(const UpdateProfileEvent.onReset());
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
            ],
          )
      ),
    );
  }


  void fulfillWidgets(Profile profile){
    setState(() {
      _emailController.text = profile.email;
      _firstNameController.text = profile.firstName;
      _lastNameController.text = profile.lastName;
      _getProfileBloc.add(const GetProfileEvent.onReset());
    });
  }

  Widget buildSaveButton(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: (){
          updateProfile();
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: MASTERPIE_YELLOW_COLOR
        ),
        child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(SAVE_LABEL, style: TextStyle(color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),)
        ),
      ),
    );
  }


  Widget buildDeleteAccountButton(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: (){
          showDeleteAccountDialog(context);
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: RED_ERROR_COLOR
        ),
        child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(DELETE_ACCOUNT_LABEL, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
        ),
      ),
    );
  }


  void showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(DELETE_LABEL, style: TextStyle(fontSize: 15, color: DARK_PRIMARY_COLOR, fontWeight: FontWeight.bold),),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DELETE_ACCOUNT_MSG, style: TextStyle(fontSize: 14, color: DARK_PRIMARY_COLOR),),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(DARK_PRIMARY_COLOR),
              ),
              child: const Text(YES_LABEL, style: TextStyle(fontSize: 14, color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
                _deleteAccount();
              },
            ),
          ],
        );
      },
    );
  }


  void _deleteAccount(){
    _getProfileBloc.add(const GetProfileEvent.onDeleteProfile());
  }



  Widget buildNameTextField({
    required String hintText,
    String? initialValue,
    required TextEditingController controller,
    bool isEditable = true,
  }) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        cursorColor: DARK_PRIMARY_COLOR,
        controller: controller,
        enabled: isEditable,
        decoration: InputDecoration(
          labelText: hintText,
          border:  const OutlineInputBorder(borderSide: BorderSide(color: DARK_PRIMARY_COLOR),),
          fillColor: Colors.white,
        ),
      ),
    );
  }

}
