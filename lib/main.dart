import 'package:amit_shop/shard/bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/bottom_navigation_screen.dart';
import 'Screens/categories_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/item_details_screen.dart';
import 'Screens/login_screen.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
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

