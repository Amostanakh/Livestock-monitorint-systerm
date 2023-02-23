// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
// import 'package:livestock_sms/config/configuring.dart';
// import 'package:livestock_sms/pages/loginscreen.dart';

// import '../models/user.model.dart';

// class Navigation extends GetView<NavigationController> {
//   const Navigation({super.key});

//   @override
//   Widget build(BuildContext context) {
//   //  Get.put<NavigationController>(NavigationController());
//     return FutureBuilder(
//       future: controller.getUser(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.hasData) {
//             kUser.value = UserModel.fromJson(snapshot.data);
//             return Scaffold(
//               body: Obx(
//                 () => AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 150),
//                   child: controller.pages[controller.selectedPage.value],
//                 ),
//               ),
//               bottomNavigationBar: const Scaffold(),
//             );
//           }
//           return const LoginScreen();
//         }
//         return const Scaffold();
//       },
//     );
//   }
// }