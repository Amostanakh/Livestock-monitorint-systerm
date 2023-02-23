import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestock_sms/controller/authentication.dart';
import 'package:livestock_sms/pages/loginscreen.dart';
import 'package:livestock_sms/pages/signupscreen.dart';
import 'package:livestock_sms/widgets/inputs.dart';

class WelcomeScreen extends GetView<AuthController> {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/back3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/well.jpg",
            width: 200,
          ),
          const SizedBox(height: 100),
          const Center(
              child: Text(
            "Welcome to Antitheft Mobile\n            Application",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
          GestureDetector(
            onTap: () async {
              Get.to(const SignUpScreen());
            },
            child: Container(
              margin: const EdgeInsets.all(12),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.orange),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              Get.to(const LoginScreen());
            },
            child: Container(
              margin: const EdgeInsets.all(12),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.orange),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
