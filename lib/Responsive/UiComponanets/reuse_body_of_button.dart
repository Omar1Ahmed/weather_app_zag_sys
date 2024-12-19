import 'package:flutter/material.dart';



ElevatedButton elevatedButtonBody({required Widget child}){
  return  ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 2,
                     // color: AppColors.accentColor,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              onPressed: () {},
              child: child,
            );
}