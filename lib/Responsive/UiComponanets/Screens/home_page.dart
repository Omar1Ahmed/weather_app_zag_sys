import 'package:flutter/material.dart';
import 'package:weather_app_zag_sys/Responsive/ReusableWidgets/weather_card.dart';
import 'package:weather_app_zag_sys/theming/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}