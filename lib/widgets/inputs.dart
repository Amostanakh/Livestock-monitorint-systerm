import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestock_sms/pages/add.contact.dart';
import 'package:livestock_sms/pages/livestock.search.dart';
import 'package:livestock_sms/pages/loginscreen.dart';
import 'package:livestock_sms/pages/livestock.chat.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media.innovationorigins.com/2022/04/monika-kubala-OpMfiq8nPI0-unsplash-scaled.jpg'),
          ),
          accountEmail: Text('livestock.tracking.com'),
          accountName: Text(
            'Track your Livestock',
            style: TextStyle(fontSize: 24.0),
          ),
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.all_out),
          title: const Text(
            'Special case',
            style: TextStyle(fontSize: 15.0),
          ),
          // onTap: () => Get.to(LivestockDetails(
          //   chatRoomId: 'jhiho',
          //   userMap: {'jhgh': 'ghgghgh'},
          // )),
        ),
        ListTile(
          onTap: () => Get.to(const AddAnimal()),
          leading: const Icon(Icons.add),
          title: const Text(
            'Add livestock',
            style: TextStyle(fontSize: 15.0),
          ),
          // onTap: () => Get.to(const AllUserDetails()),
        ),
        ListTile(
          onTap: () => Get.to(const LoginScreen()),
          leading: const Icon(Icons.logout),
          title: const Text(
            'log-out',
            style: TextStyle(fontSize: 15.0),
          ),
          // onTap: () => Get.to(const AllUserDetails()),
        ),
      ],
    ));
  }
}

class TextFields extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const TextFields(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            cursorColor: Colors.black,
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(70),
              ),
              filled: true,
              fillColor: Colors.grey.withOpacity(0.25),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}

class Btton extends StatelessWidget {
  const Btton({super.key, this.text, this.onTap});
  final Function()? onTap;
  final Widget? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(12),
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.amber.shade800,
            borderRadius: BorderRadius.circular(20)),
        child: text,
      ),
    );
  }
}

class ChatWidgets {
  static Widget card({title, time, subtitle, onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Card(
        elevation: 0,
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.all(5),
          leading: const Padding(
            padding: EdgeInsets.all(0.0),
            child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                )),
          ),
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle) : null,
          trailing: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(time),
          ),
        ),
      ),
    );
  }

  static Widget circleProfile({onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(
                width: 50,
                child: Center(
                    child: Text(
                  'John',
                  style:
                      TextStyle(height: 1.5, fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                )))
          ],
        ),
      ),
    );
  }

  static messageField({required onSubmit}) {
    final con = TextEditingController();
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextField(
        controller: con,
        // decoration: Styles.messageTextFieldStyle(onSubmit: () {
        //   onSubmit(con);
        // }),
      ),
//decoration: Styles.messageFieldCardStyle(),
    );
  }
}
