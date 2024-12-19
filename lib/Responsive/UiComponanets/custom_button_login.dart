import 'package:flutter/material.dart';
import 'package:weather_app_zag_sys/Responsive/UiComponanets/custom_text.dart';


ElevatedButton customButtonLogin({required String text,required Color color,required VoidCallback onClick}){
  return ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    backgroundColor:  WidgetStatePropertyAll<Color>(
                        color),
                        ),
                onPressed: onClick,
                child: CustomText(
                    text: text, fontWeight: FontWeight.w400, fontSize: 16,),
              );
}