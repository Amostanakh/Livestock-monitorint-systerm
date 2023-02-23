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
            0xFF8FA93A,
            {
              50: Color.fromRGBO(143, 169, 58, .1),
              100: Color.fromRGBO(143, 169, 58, .2),
              200: Color.fromRGBO(143, 169, 58, .3),
              300: Color.fromRGBO(143, 169, 58, .4),
              400: Color.fromRGBO(143, 169, 58, .5),
              500: Color.fromRGBO(143, 169, 58, .6),
              600: Color.fromRGBO(143, 169, 58, .7),
              700: Color.fromRGBO(143, 169, 58, .8),
              800: Color.fromRGBO(143, 169, 58, .9),
              900: Color.fromRGBO(143, 169, 58, 1),
            },
          ),
        ));
  }
}
