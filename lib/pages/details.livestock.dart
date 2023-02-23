import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:livestock_sms/controller/authentication.dart';

class LivestockDetails extends GetView<AuthController> {
  final DocumentSnapshot livestock;
  const LivestockDetails(
    this.livestock, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LIVESTOCK DETAILS",
          maxLines: 1,
          softWrap: true,
          style: TextStyle(
              color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                // decoration:
                // BoxDecoration(borderRadius: BorderRadius.circular(60)),
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/kk.jpg')),
            Center(
                child: Text("PHONE NUMBER:      ${livestock['PhoneNmuber']}")),
            Center(child: Text("TAG NO:           ${livestock['TagNo']}")),
            Center(
                child: Text(
                    "DATE OF BIRTH:           ${livestock['Date Of Birth']}")),
            Center(
                child: Text(
                    "DATE ENTRY ON FARM:        ${livestock['Date of Entry on Farm']}")),
            Center(
                child: Text("MOTHRERS TAG:      ${livestock['MothersTag']}")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      List<String> recipents = [livestock['PhoneNmuber']];
                      void _sendSMS(
                          String message, List<String> recipents) async {
                        String result = await sendSMS(
                                message: message, recipients: recipents)
                            .catchError((onError) {
                          print(onError);
                        });
                        print(result);
                      }

                      _sendSMS("This is a test message!", recipents);
                    },
                    child: Text("SEND SMS")),
                TextButton(onPressed: () {}, child: Text("CALL ME")),
                TextButton(onPressed: () {}, child: Text("LOCATE ME")),
              ],
            )
          ]),
    );
  }
}
