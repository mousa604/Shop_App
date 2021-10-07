import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/bottm_navvigtion_screen.dart';
import 'Screens/categories_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/item_details_screen.dart';
import 'Screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      home:LoginScreen(),
    );
  }
}

