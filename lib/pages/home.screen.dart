import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:livestock_sms/controller/authentication.dart';
import 'package:livestock_sms/widgets/inputs.dart';

import 'livestock.chat.dart';

class MyHomePage extends GetView<AuthController> {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AdminDrawer(),
      appBar: AppBar(
        title: const Text('LiveStock Names'),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(LivestockDetails(
                  chatRoomId: 'ID:1234567',
                  userMap: const {'Name': 'LiveStock 1'},
                ));
              },
              child: const ListTile(
                title: Text('Name:Livestock 1'),
                subtitle: Text('ID:1234567'),
              ),
            ),
            GestureDetector(
              onTap: () {
                _sendSMS("This is a test message!", recipents);
              },
              child: const ListTile(
                title: Text('Name:Livestock 2'),
                subtitle: Text('ID:7634512'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> recipents = ["9876543210", "8765432190"];
void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}
// children: <Widget>[
//             GestureDetector(
//               onTap: () {
//                 _sendSMS("This is a test message!", recipents);
//               },
//               child: const ListTile(
//                 title: Text('Livestock A'),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 _sendSMS("This is a test message!", recipents);
//               },
//               child: const ListTile(
//                 title: Text('Livestock B'),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 _sendSMS("This is a test message!", recipents);
//               },
//               child: const ListTile(
//                 title: Text('Livestock C'),
//               ),
//             ),
//             const ListTile(
//               title: Text('Livestock D'),
//             ),
//           ],