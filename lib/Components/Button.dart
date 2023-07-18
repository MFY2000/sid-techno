import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:sid_techno/Screen/Hone.dart';

class Button extends StatelessWidget {
  final String text;
  const Button({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => HomeScreen()),
      child: Container(
          width: double.infinity,
          height: Get.height * .06,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(208, 235, 110, 42),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white),
          ),
          child: Text(text, style: TextStyle(color: Colors.white))),
    );
  }
}
