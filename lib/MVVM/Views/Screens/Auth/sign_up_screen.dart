import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_zag_sys/Responsive/UiComponanets/InfoWidget.dart';
import 'package:weather_app_zag_sys/helpers/extantions.dart';

import '../../../../routing/routs.dart';
import '../../../View_Models/auth_VeiwModels/auth_cubit.dart';
import '../../ReusableWidgets/custom-text-form_field.dart';
import '../../ReusableWidgets/custom_button_login.dart';
import '../../ReusableWidgets/custom_text.dart';
import '../../ReusableWidgets/inside_button.dart';
import '../../ReusableWidgets/reuse_body_of_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var formKey = GlobalKey<FormState>();
    return Infowidget(builder: (context, info) {
      return BlocConsumer<AuthCubit, AuthState>( listener: (context, state) {

        if(state is AuthSuccess){
          context.read<AuthCubit>().close();
          context.pushNamed(Routes.homePage);
        }
      },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,

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
                            text: "Register",
                            fontWeight: FontWeight.w700,
                            fontSize: 32),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomText(
                            text: "Gmail", fontWeight: FontWeight.w400, fontSize: 16),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormFieldForEmail(
                            hint: "Example:user@gmail.com",
                            controller: context.read<AuthCubit>().emailController),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(
                            text: "User Name", fontWeight: FontWeight.w400, fontSize: 16),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormFieldForEmail(
                            hint: "Omar",
                            controller: context.read<AuthCubit>().DisplayNameController, isMail: false),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(
                            text: "Password",
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextFieldFOrPassword(
                            hint: " your password", controller: context.read<AuthCubit>().passwordController),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                            text: "Confirm Password",
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextFieldFOrPassword(
                            hint: "confirm your password",
                            controller: context.read<AuthCubit>().RewritePassController),
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
                                color: const Color.fromARGB(255, 164, 145, 145),
                                //AppColors.accentColor,
                                onClick: () async {
                                  if (formKey.currentState!.validate()) {

                                    context.read<AuthCubit>().signup();
                                  }

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
                        elevatedButtonBody(
                            child: insideButton(
                                text: "Register With Google",
                                asset: "assets/images/google.png")),
                        const SizedBox(
                          height: 20,
                        ),
                        elevatedButtonBody(
                            child: insideButton(
                                text: "Register With Appe",
                                asset: "assets/images/apple.png")),
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
          });
    });
  }
}
