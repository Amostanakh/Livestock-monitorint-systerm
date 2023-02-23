import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestock_sms/controller/authentication.dart';
import 'package:livestock_sms/pages/forget.password.dart';
import 'package:livestock_sms/pages/signupscreen.dart';
import 'package:livestock_sms/widgets/inputs.dart';

class DeleteAccount extends GetView<AuthController> {
  const DeleteAccount({
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
                          'Delete',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                      ),
                onTap: () async {
                  controller.delete();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () => Get.to(const SignUpScreen()),
                    child: const Text(
                      "Don't have account sign up",
                      style: TextStyle(color: Colors.white),
                    )),
                GestureDetector(
                    onTap: () {
                      Get.to(const ForgetPassword());
                    },
                    child: const Text(
                      'forgot password',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
