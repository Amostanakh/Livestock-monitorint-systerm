import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestock_sms/controller/authentication.dart';
import 'package:livestock_sms/pages/signupscreen.dart';
import 'package:livestock_sms/widgets/inputs.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      body: ListView(children: [
        Stack(
          alignment: Alignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 310),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/cow.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  TextFields(
                      controller: controller.emailController,
                      hintText: 'Email'),
                  TextFields(
                      controller: controller.emailController,
                      hintText: 'Email'),
                  Btton(
                    onTap: () {
                      controller.login();
                    },
                    text: const Center(child: Text('Sign-In')),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () => Get.to(const SignUpScreen()),
                          child: const Text("Don't have account sign up")),
                      GestureDetector(
                          onTap: () {}, child: const Text('forgot password'))
                    ],
                  ),
                ],
              ),
            ),
            // TextFields(controller: controller.emailController, hintText: 'Email'),

            // TextFields(
            //     controller: controller.passwordController, hintText: 'Password'),
            // Btton(
            //   onTap: () {
            //     controller.login();
            //   },
            //   text: const Center(child: Text('Sign-In')),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     GestureDetector(
            //         onTap: () => Get.to(const SignUpScreen()),
            //         child: const Text("Don't have account sign up")),
            //     GestureDetector(
            //         onTap: () {}, child: const Text('forgot password'))
            //   ],
            // )
            // Icon(Icons.send),
          ],
        ),
      ]),
    );
  }
}
