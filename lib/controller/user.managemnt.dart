import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:livestock_sms/config/configuring.dart';
import 'package:livestock_sms/pages/home.screen.dart';

class UserManagement {
  storeNewUser(user, context, String username, String userPhoneNumber,
      String homeAddress) async {
    //  User? currentFirebaseUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection('users').doc(kUser.value!.uid).set({
      'email': user.email,
      'uid': user.uid,
      'username': username,
      "userPhoneNumber": userPhoneNumber,
      "homeAddress": homeAddress
    }).then((value) => Get.offAll(() => const MyHomePage()));

    //.catchError((e) {});
  }
}
