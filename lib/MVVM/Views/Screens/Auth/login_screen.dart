import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_zag_sys/Responsive/UiComponanets/InfoWidget.dart';
import 'package:weather_app_zag_sys/MVVM/Views/Screens/Auth/sign_up_screen.dart';
import 'package:weather_app_zag_sys/helpers/extantions.dart';

import '../../../../routing/routs.dart';
import '../../../View_Models/auth_VeiwModels/auth_cubit.dart';
import '../../ReusableWidgets/custom-text-form_field copy.dart';
import '../../ReusableWidgets/custom_button_login.dart';
import '../../ReusableWidgets/custom_text.dart';
import '../../ReusableWidgets/inside_button.dart';
import '../../ReusableWidgets/reuse_body_of_button.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {


    var formKey = GlobalKey<FormState>();

    return Infowidget(builder: (context, info) {
      return Scaffold(
        
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: CustomText(
              text: "Login", fontWeight: FontWeight.w700, fontSize: info.screenWidth * 0.07),

        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is AuthSuccess){
              context.read<AuthCubit>().close();
              context.pushNamed(Routes.homePage);
            }
          },
          builder: (context, state) {
      return Padding(
          padding: EdgeInsetsDirectional.only(start: info.screenWidth * 0.05, end: info.screenWidth * 0.05,top: info.screenWidth * 0.2),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: info.screenHeight * 0.025,
                children: [

                  CustomText(
                      text: "Gmail", fontWeight: FontWeight.w500, fontSize: info.screenWidth * 0.04),

                  TextFormFieldForEmail(
                      hint: "Example:user@gmail.com",
                      controller: context.read<AuthCubit>().emailController),

                  CustomText(
                      text: "Password",
                      fontWeight: FontWeight.w500, fontSize: info.screenWidth * 0.04),

                  customTextFieldFOrPassword(
                      hint: " your password", controller: context.read<AuthCubit>().passwordController),

                  if(state is AuthFailure)
                    Text(state.error,style: TextStyle(color: Colors.red),),

                  Padding(padding: EdgeInsetsDirectional.only(start: info.screenWidth * 0.1,end: info.screenWidth * 0.1,top: info.screenHeight * 0.02),
                    child: SizedBox(
                    height: info.screenHeight * 0.05,
                    width: double.infinity,
                    child: customButtonLogin(
                        text: "LOGIN",
                        color: const Color.fromARGB(255, 169, 157, 157),
                        onClick: () async {
                          if (formKey.currentState!.validate()) {

                            await context.read<AuthCubit>().login();
                          }

                        }),
                  ),),

                  SizedBox(height: info.screenHeight * 0.02,),

                  Divider(
                    thickness: info.screenWidth * 0.003,indent: info.screenWidth * 0.1,endIndent: info.screenWidth * 0.1,),

                  elevatedButtonBody(
                      child: insideButton(
                          text: "Login With Google",
                          asset: "assets/images/google.png")),

                  elevatedButtonBody(
                      child: insideButton(
                          text: "Login With Apple",
                          asset: "assets/images/apple.png")),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: "Don’t have an account? ",
                          fontWeight: FontWeight.w400,
                          fontSize: info.screenWidth * 0.03),
                      InkWell(
                          onTap: () {
                            context.pushNamed(Routes.signUpScreen);
                          },
                          child: CustomText(
                              text: "Register",
                              fontWeight: FontWeight.w500,
                              fontSize: info.screenWidth * 0.03)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
  },
),
      );
    });
  }
}
