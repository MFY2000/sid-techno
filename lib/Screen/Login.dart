import "package:get/get.dart";
import 'package:flutter/material.dart';
import 'package:sid_techno/Components/TextInput.dart';
import 'package:sid_techno/Components/Button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: Get.height,
          padding: EdgeInsets.symmetric(
              vertical: Get.height * .05, horizontal: Get.width * .1),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            const SizedBox(height: 80),
            SizedBox(
              height: Get.height * .2,
              width: Get.width * .4,
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(right: Get.height * .05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Train and live the new experience of exercising at home",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            primaryInput(
              controller: TextEditingController(),
              onChanged: (s) {},
              labelText: "Email",
              isPassword: false,
            ),
            const SizedBox(height: 20),
            primaryInput(
                controller: TextEditingController(),
                onChanged: (s) {},
                labelText: "Password"),
            Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(top: Get.width * .05),
                child: const Text(
                  "Forget your Password !",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(height: 40),
            Button(text: "Login"),
            const SizedBox(height: 20),
            Button(text: "Sign up"),
          ]),
        ));
  }
}
