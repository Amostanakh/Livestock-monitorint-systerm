import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/cow2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailText(
                controller: controller.emailController, hintText: 'Email'),
            PasswordText(
                controller: controller.passwordController,
                hintText: 'Password'),
            Obx(
              () => Btton(
                text: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: Colors.black,
                      ))
                    : const Center(
                        child: Text(
                          'Sign-Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                      ),
                onTap: () async {
                  controller.signup(context);
                },
              ),
            ),
            GestureDetector(
                onTap: () => Get.to(const LoginScreen()),
                child: const Text(
                  "Already have an account Sign-In",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),

      //TextFormFilds(hintText: "Name", controller: controller.userName),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         // TextFormFilds(hintText: "Name", controller: controller.userName),
      //         // TextFormFilds(
      //         //     hintText: "userPhoneNumber",
      //         //     controller: controller.userPhoneNumber),
      //         // TextFormFilds(
      //         //     hintText: "homeAddressr", controller: controller.homeAddress),
    );
  }
}
