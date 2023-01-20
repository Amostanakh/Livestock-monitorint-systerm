import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:livestock_sms/controller/authentication.dart';

class LivestockDetails extends GetView<AuthController> {
  const LivestockDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Cow A'))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: () {
                _sendSMS("This is a test message!", recipents);
              },
              child: const Text('Send')),
          // TextFields(hintText: 'Type your message'),

          ListTile(
            title: TextFormField(),
            // controller: _controllerMessage,
            // onChanged: (String value) => setState(() {}),
          ),
          // Icon(Icons.send),
        ],
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
