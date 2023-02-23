//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestock_sms/pages/details.livestock.dart';

import '../config/configuring.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String name = "";
  List<Map<String, dynamic>> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            margin: const EdgeInsets.all(12),
            height: 45,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7.0,
                )
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: TextFormField(
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  hintText: 'Search by phoneNumber...'),
            ),
          ),
        ),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: ListView(padding: EdgeInsets.only(top: 20), children: [
            GestureDetector(
              onTap: () {
                Get.to(const Search());
              },
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(kUser.value?.uid)
                    .collection('myLivestocks')
                    .snapshots(),
                builder: (context, snapshots) {
                  return (snapshots.connectionState == ConnectionState.waiting)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshots.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot livestock =
                                snapshots.data!.docs[index];

                            if (name.isEmpty) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(LivestockDetails(livestock));
                                },
                                child: ListTile(
                                  leading: const Image(
                                      image: AssetImage("assets/cow3.png")),
                                  title: Text(
                                    livestock['PhoneNmuber'],
                                    maxLines: 1,
                                    softWrap: true,
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    livestock['Date Of Birth'],
                                    maxLines: 1,
                                    softWrap: true,
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: GestureDetector(
                                      onTap: () {
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
                                                  FirebaseFirestore.instance
                                                      .runTransaction((Transaction
                                                          myTransaction) async {
                                                    myTransaction.delete(
                                                        livestock.reference);
                                                  }).then((value) =>
                                                          Get.back());
                                                  // Get.snackbar(
                                                  //     'Livestock Successfully Deleted',
                                                  //     'check to your Animal list');
                                                }),
                                          ],
                                        );
                                      },
                                      child: const Icon(Icons.delete)),
                                ),
                              );
                            }
                            if (livestock['PhoneNmuber']
                                .toString()
                                .toLowerCase()
                                .startsWith(name.toLowerCase())) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(LivestockDetails(livestock));
                                },
                                child: ListTile(
                                  leading: const Image(
                                      image: AssetImage("assets/cow3.png")),
                                  title: Text(
                                    livestock['PhoneNmuber'],
                                    maxLines: 1,
                                    softWrap: true,
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    livestock['Date Of Birth'],
                                    maxLines: 1,
                                    softWrap: true,
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: GestureDetector(
                                      onTap: () {
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
                                                  FirebaseFirestore.instance
                                                      .runTransaction((Transaction
                                                          myTransaction) async {
                                                    myTransaction.delete(
                                                        livestock.reference);
                                                  }).then((value) =>
                                                          Get.back());
                                                  // Get.snackbar(
                                                  //     'Livestock Successfully Deleted',
                                                  //     'check to your Animal list');
                                                }),
                                          ],
                                        );
                                      },
                                      child: const Icon(Icons.delete)),
                                ),
                              );
                            }
                            return Container();
                          });
                },
              ),
            ),
          ]),
        ));
  }
}
