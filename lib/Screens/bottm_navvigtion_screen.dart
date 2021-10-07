import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'categories_screen.dart';
import 'home_screen.dart';
import 'menu_screen.dart';

class BottomNavigtionScreen extends StatefulWidget {
  const BottomNavigtionScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigtionScreenState createState() => _BottomNavigtionScreenState();
}

class _BottomNavigtionScreenState extends State<BottomNavigtionScreen> {
  List screens =[
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    MenuScreen(),
  ];

  var currentIndex=0;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (value){
          setState(() {
            currentIndex=value;
          });
        },

        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,size:size.height*.04 ,),label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined,size:size.height*.04 ,),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,size:size.height*.04 ,),label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.menu,size:size.height*.04 ,),label: 'Menu'),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
