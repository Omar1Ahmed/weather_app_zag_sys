import 'package:flutter/material.dart';
import 'package:weather_app_zag_sys/routing/appRouting.dart';
import 'package:weather_app_zag_sys/routing/routs.dart';

void main() {

  runApp(MyApp(
    appRouter: AppRouts(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouts appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.loginScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
