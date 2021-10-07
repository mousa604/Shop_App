import 'package:amit_shop/cubit/cubit.dart';
import 'package:amit_shop/cubit/stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_screen.dart';
import 'categories_screen.dart';
import 'home_screen.dart';
import 'menu_screen.dart';

class BottomNavigtionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return BlocProvider(
      create: (BuildContext context) =>AppCubit(),
      child: BlocConsumer<AppCubit,AppStats>(
        listener: (context,stats){},
        builder: (context,stats){
          AppCubit cubit =AppCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex:cubit. currentIndex,
              onTap: (value){
              cubit.changeCurrentIndex(value);
              },

              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home,size:size.height*.04 ,),label: 'Home',),
                BottomNavigationBarItem(icon: Icon(Icons.category_outlined,size:size.height*.04 ,),label: 'Categories'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,size:size.height*.04 ,),label: 'Cart'),
                BottomNavigationBarItem(icon: Icon(Icons.menu,size:size.height*.04 ,),label: 'Menu'),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}


