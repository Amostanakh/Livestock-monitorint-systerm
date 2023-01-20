import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:livestock_sms/controller/authentication.dart';
import 'package:livestock_sms/widgets/inputs.dart';

class AddAnimal extends GetView<AuthController> {
  const AddAnimal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text('Add Livestock contact'))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFields(
              controller: controller.emailController, hintText: 'ID number'),

          TextFields(
              controller: controller.passwordController, hintText: 'Gender'),

          const Btton(
            // onTap: () => Get.to(const MyHomePage()),
            text: Center(child: Text('Add contact')),
          ),
          // Icon(Icons.send),
        ],
      ),
    );
  }
}
