import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:livestock_sms/controller/authentication.dart';
import 'package:livestock_sms/pages/home.screen.dart';
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
          title: const Center(child: Text("Register")),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 70),
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Live",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
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
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
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
            TextFormFilds(hintText: "Name", controller: controller.userName),
            TextFormFilds(
                hintText: "PhoneNumber",
                controller: controller.userPhoneNumber),
            TextFormFilds(
                hintText: "Address", controller: controller.homeAddress),
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
                  //Get.to(const MyHomePage());
                },
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Already have an account-",
                style: TextStyle(color: Colors.black),
              ),
              GestureDetector(
                onTap: () => Get.to(const LoginScreen()),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 15,
                  ),
                ),
              )
            ]),
          ],
        ));
  }
}
