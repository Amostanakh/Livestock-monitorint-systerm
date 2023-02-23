import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestock_sms/controller/authentication.dart';
import 'package:livestock_sms/pages/forget.password.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Login")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Live",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                ),
                Text(
                  "stock",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 30,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  "Antitheft",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            thickness: 1,
            color: Colors.black,
          ),
          const Center(
              child: Text(
            "Protecting Your Livestock",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          )),
          const SizedBox(
            height: 12,
          ),
          EmailText(controller: controller.emailController, hintText: 'Email'),
          PasswordText(
              controller: controller.passwordController, hintText: 'Password'),
          Obx(
            () => Btton(
              text: controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                  : const Center(
                      child: Text(
                        'Sign-In',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                    ),
              onTap: () async {
                controller.login();
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have account-",
                style: TextStyle(color: Colors.black),
              ),
              GestureDetector(
                onTap: () => Get.to(const SignUpScreen()),
                child: const Text(
                  "SignUp",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                width: 70,
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(const ForgetPassword());
                  },
                  child: const Text(
                    'Forgot Your password',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
