import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_zag_sys/MVVM/View_Models/HomePage/home_page_cubit.dart';
import 'package:weather_app_zag_sys/MVVM/View_Models/auth_VeiwModels/auth_cubit.dart';

import 'package:weather_app_zag_sys/MVVM/Views/Screens/Auth/login_screen.dart';

import 'package:weather_app_zag_sys/routing/routs.dart';

import '../MVVM/Views/Screens/Auth/sign_up_screen.dart';
import '../MVVM/Views/Screens/HomePage/HomePage_Screen.dart';
import '../MVVM/Views/Screens/Splash/Splash_Screen.dart';


class AppRouts {

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (_) => HomePageCubit(),
                  child: const MyHomePage(title: 'Weather App',)),
        );

      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => AuthCubit(),
              child: LoginScreen(),
            ));

      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => AuthCubit(),
              child: RegisterScreen(),
            ));


      default:
        return null;
    }
  }
}
