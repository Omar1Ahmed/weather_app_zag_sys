
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../theming/colors.dart';
import '../../../View_Models/HomePage/home_page_cubit.dart';
import '../../ReusableWidgets/weather_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return BlocBuilder<HomePageCubit, HomePageState>(
    //     listener: (context, state) {
    //
    //
    // },
        builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Hello AbdQader',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.dark_mode, color: Colors.black),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 17),
              const Text(
                'Discover the weather',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              WeatherCard(
                location: 'Palestine',
                city: 'Gaza',
                condition: 'Sunny',
                temperature: '27 °C',
                backgroundColor: ColorsManager.cardBackgrounColor,
              ),
              const SizedBox(height: 30),
              const Text(
                'Around the world',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  WeatherCard(
                    location: 'United Kingdom',
                    city: 'London',
                    condition: 'Partly cloudy',
                    temperature: '18 °C',
                    backgroundColor: ColorsManager.cardBackgrounColor,
                  ),
                  WeatherCard(
                    location: 'Egypt',
                    city: 'Cairo',
                    condition: 'Partly cloudy',
                    temperature: '30 °C',
                    backgroundColor: ColorsManager.cardBackgrounColor,
                  ),
                  WeatherCard(
                    location: 'Mexico',
                    city: 'Alaska',
                    condition: 'Sunny',
                    temperature: '22 °C',
                    backgroundColor: ColorsManager.cardBackgrounColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
