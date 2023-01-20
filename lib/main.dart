import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:livestock_sms/pages/loginscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: const MaterialColor(
            0xffFC8F22,
            {
              50: Color.fromRGBO(252, 143, 34, .1),
              100: Color.fromRGBO(252, 143, 34, .2),
              200: Color.fromRGBO(252, 143, 34, .3),
              300: Color.fromRGBO(252, 143, 34, .4),
              400: Color.fromRGBO(252, 143, 34, .5),
              500: Color.fromRGBO(252, 143, 34, .6),
              600: Color.fromRGBO(252, 143, 34, .7),
              700: Color.fromRGBO(252, 143, 34, .8),
              800: Color.fromRGBO(252, 143, 34, .9),
              900: Color.fromRGBO(252, 143, 34, 1),
            },
          ),
        ));
  }
}
