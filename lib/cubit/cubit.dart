import 'package:amit_shop/Screens/cart_screen.dart';
import 'package:amit_shop/Screens/categories_screen.dart';
import 'package:amit_shop/Screens/home_screen.dart';
import 'package:amit_shop/Screens/menu_screen.dart';
import 'package:amit_shop/cubit/stats.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStats>
{
  AppCubit() : super(InationalStats());
  static AppCubit get (context)=> BlocProvider.of(context);


  var currentIndex = 0;
  List screens =[
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    MenuScreen(),
  ];
  void changeCurrentIndex(value){
    currentIndex=value;
    emit(NavBarChange());
  }

  static var cartItems =[];
  void addToCart(item ){
    cartItems.add(item);
  }

  int count =1;
  void add(){
    count++;
    emit(AddCountChange());

  }
  void subtract(){
    count--;
    emit(SubtractCountChange());

  }

  void clearCart(){
    cartItems.clear();
    emit(ClearCartChange());
  }
  void removeItem(item){
    cartItems.remove(item);
    emit(RemoveItemFromCartChange());
  }

}