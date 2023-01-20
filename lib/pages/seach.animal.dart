import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Container(
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
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            border: InputBorder.none,
            hintText: 'Start typing...'),
      ),
    );
  }
}
