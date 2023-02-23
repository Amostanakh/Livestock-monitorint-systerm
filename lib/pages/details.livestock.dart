import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
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
      body: ListView(children: [
        Container(
            // decoration:
            // BoxDecoration(borderRadius: BorderRadius.circular(60)),
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/kk.jpg')),
        ListTile(title: Text("PHONE NUMBER:      ${livestock['PhoneNmuber']}")),
        ListTile(title: Text("TAG NO:           ${livestock['TagNo']}")),
        ListTile(
            title:
                Text("DATE OF BIRTH:           ${livestock['Date Of Birth']}")),
        ListTile(
            title: Text(
                "DATE ENTRY ON FARM:        ${livestock['Date of Entry on Farm']}")),
        ListTile(title: Text("MOTHRERS TAG:      ${livestock['MothersTag']}")),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  List<String> recipents = [livestock['PhoneNmuber']];
                  // ignore: no_leading_underscores_for_local_identifiers
                  void _sendSMS(String message, List<String> recipents) async {
                    String result =
                        await sendSMS(message: message, recipients: recipents)
                            .catchError((onError) {});
                  }

                  _sendSMS("This is a test message!", recipents);
                },
                child: const Text("SEND SMS")),
            TextButton(onPressed: () {}, child: const Text("LOCATE ME")),
            TextButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Alert",
                    content: Text(
                        "Are you sure you want to delete livestock with ID:${livestock['PhoneNmuber']}"),
                    actions: [
                      TextButton(
                        child: const Text("No"),
                        onPressed: () => Get.back(),
                      ),
                      TextButton(
                          child: const Text("Yes"),
                          onPressed: () {
                            FirebaseFirestore.instance.runTransaction(
                                (Transaction myTransaction) async {
                              myTransaction.delete(livestock.reference);
                            }).then((value) => Get.back());
                            // Get.snackbar(
                            //     'Livestock Successfully Deleted',
                            //     'check to your Animal list');
                          }),
                    ],
                  );
                },
                child: const Text("DELETE")),
          ],
        )
      ]),
    );
  }
}
