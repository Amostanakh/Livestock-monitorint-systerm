import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestock_sms/pages/home.screen.dart';

class AuthController extends GetxController {
  TextEditingController smsController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signup() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((signedInUser) async {
      Get.offAll(() => const MyHomePage());
    }).catchError((e) {
      // Get.defaultDialog(
      //   title: "Alert!",
      //   content: const Text("Email or password error, try again"),
      //   actions: [
      //     TextButton(
      //       child: const Text("ok"),
      //       onPressed: () => Get.back(),
      //     ),
      //   ],
      // );
    });
  }

  void login() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((signedInUser) async {
      Get.offAll(() => const MyHomePage());
    }).catchError((e) {
      // Get.defaultDialog(
      //   title: "Alert!",
      //   content: const Text("Email or password error, try again"),
      //   actions: [
      //     TextButton(
      //       child: const Text("ok"),
      //       onPressed: () => Get.back(),
      //     ),
      //   ],
      // );
    });
  }
}
