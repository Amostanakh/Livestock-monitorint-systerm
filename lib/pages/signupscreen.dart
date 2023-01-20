import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:livestock_sms/controller/authentication.dart';
import 'package:livestock_sms/pages/loginscreen.dart';
import 'package:livestock_sms/widgets/inputs.dart';

class SignUpScreen extends GetView<AuthController> {
  const SignUpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text('Livestock messeges'))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFields(controller: controller.emailController, hintText: 'Email'),

          TextFields(
              controller: controller.passwordController, hintText: 'Password'),

          Btton(
              onTap: () {
                controller.signup();
              },
              text: const Center(child: Text('Sign-Up'))),

          GestureDetector(
              onTap: () => Get.to(const LoginScreen()),
              child: const Text("Already have an account Sign-In")),

          // Icon(Icons.send),
        ],
      ),
    );
  }
}
