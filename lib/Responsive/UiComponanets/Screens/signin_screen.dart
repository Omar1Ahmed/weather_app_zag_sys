

import 'package:flutter/material.dart';
import 'package:weather_app_zag_sys/Responsive/UiComponanets/Screens/login_screen.dart';
import 'package:weather_app_zag_sys/Responsive/UiComponanets/custom-text-form_field.dart';
import 'package:weather_app_zag_sys/Responsive/UiComponanets/custom_button_login.dart';
import 'package:weather_app_zag_sys/Responsive/UiComponanets/custom_text.dart';
import 'package:weather_app_zag_sys/Responsive/UiComponanets/inside_button.dart';
import 'package:weather_app_zag_sys/Responsive/UiComponanets/reuse_body_of_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
     TextEditingController passwordController =TextEditingController();
    TextEditingController emailController =TextEditingController();
    var formKey =GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined,
             // color: AppColors.secondaryColor
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 25),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: "Register", fontWeight: FontWeight.w700, fontSize: 32),
                const SizedBox(
                  height: 30,
                ),
                CustomText(
                    text: "Gmail", fontWeight: FontWeight.w400, fontSize: 16),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldForEmail(hint: "Example:user@gmail.com", controller: emailController),
                const SizedBox(
                  height: 20,
                ),
                CustomText(
                    text: "Password", fontWeight: FontWeight.w400, fontSize: 16),
                const SizedBox(
                  height: 10,
                ),
               customTextFieldFOrPassword(hint: " your password", controller: passwordController),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                    text: "Confirm Password", fontWeight: FontWeight.w400, fontSize: 16),
                const SizedBox(
                  height: 10,
                ),
                customTextFieldFOrPassword(hint: "confirm your password", controller: passwordController),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44, right: 40),
                  child: SizedBox(
                    height: 50,
                    width: 500,
                    child: customButtonLogin(
                        text: "Register",
                        color:const Color.fromARGB(255, 164, 145, 145) ,
                        //AppColors.accentColor,
                        onClick: () {
                           if(formKey.currentState!.validate()){
         print(emailController.text);
          print(passwordController.text);

          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const LoginScreen();
                          }));

                        }
                          // Navigator.push(context, MaterialPageRoute(builder: (context){
                          //   return const LoginScreen();
                          // }));
                        }),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                          "----------------------------------------------- or ----------------------------------------- "),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
               elevatedButtonBody(child: insideButton(text: "Register With Google", asset: "assets/images/google.png")),
              const SizedBox(
                height: 20,
              ),
              elevatedButtonBody(child: insideButton(text: "Register With Appe", asset: "assets/images/apple.png")),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: "Already have an account? ",
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CustomText(
                            text: "Login",
                            fontWeight: FontWeight.w400,
                            fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
