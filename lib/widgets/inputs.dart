import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestock_sms/config/configuring.dart';
import 'package:livestock_sms/controller/authentication.dart';
import 'package:livestock_sms/pages/add.livestock.dart';
import 'package:livestock_sms/pages/delete.account.dart';
import 'package:livestock_sms/pages/list.livestock.dart';
import 'package:livestock_sms/pages/user.guide.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class AdminDrawer extends GetView<AuthController> {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture:
              const CircleAvatar(backgroundImage: AssetImage('assets/kk.jpg')),
          accountEmail: Text('Logged in ${kUser.value?.email}'),
          accountName: const Text(
            'Track My Livestock',
            style: TextStyle(fontSize: 24.0),
          ),
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
        ),
        ListTile(
          onTap: () => Get.to(const AddLiveStock()),
          leading: const Icon(Icons.add),
          title: const Text(
            'Add livestock',
            style: TextStyle(fontSize: 15.0),
          ),
          // onTap: () => Get.to(const AllUserDetails()),
        ),
        ListTile(
          leading: const Icon(Icons.list),
          title: const Text(
            'Livestock List',
            style: TextStyle(fontSize: 15.0),
          ),
          onTap: () => Get.to(const Search()),
        ),
        ListTile(
          onTap: () => Get.to(const UserGuide()),
          leading: const Icon(Icons.integration_instructions),
          title: const Text(
            'Help',
            style: TextStyle(fontSize: 15.0),
          ),
          // onTap: () => Get.to(const AllUserDetails()),
        ),
        ListTile(
          onTap: () {
            controller.signOut();
          },
          leading: const Icon(Icons.logout),
          title: const Text(
            'log-out',
            style: TextStyle(fontSize: 15.0),
          ),
          // onTap: () => Get.to(const AllUserDetails()),
        ),
        ListTile(
          onTap: () => Get.to(const DeleteAccount()),
          leading: const Icon(Icons.delete_forever),
          title: const Text(
            'Delete Account',
            style: TextStyle(fontSize: 15.0),
          ),
          // onTap: () => Get.to(const AllUserDetails()),
        ),
      ],
    ));
  }
}

class EmailText extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const EmailText(
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
            validator: (value) {
              if (!GetUtils.isEmail(
                value!,
              )) {
                return "Email is not valid";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
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

class PasswordText extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const PasswordText(
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
            validator: (value) {
              if (!GetUtils.isLengthGreaterThan(value, 5)) {
                return "Minmum of 6 characters";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
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
            color: Colors.orange, borderRadius: BorderRadius.circular(10)),
        child: text,
      ),
    );
  }
}

class TextFormFilds extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const TextFormFilds(
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
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                // borderRadius: BorderRadius.all(),
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

class DateTextFormFilds extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const DateTextFormFilds(
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
            keyboardType: TextInputType.number,
            inputFormatters: [
              DateInputFormatter(),
            ],
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
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
