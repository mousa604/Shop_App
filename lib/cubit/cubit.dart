import 'package:amit_shop/Screens/cart_screen.dart';
import 'package:amit_shop/Screens/categories_screen.dart';
import 'package:amit_shop/Screens/home_screen.dart';
import 'package:amit_shop/cubit/stats.dart';
import 'package:amit_shop/logic/API.dart';
import 'package:amit_shop/models/productsVM.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  ];
  void changeCurrentIndex(value){
    currentIndex=value;
    emit(NavBarChange());
  }

  static List<Product> cartItems =[];

  void addToCart(Product item)
  {
    bool addedBefore = false;
    for(int i=0; i< cartItems.length; i++)
      {
        if(item.id == cartItems[i].id)
          {
            addedBefore = true;
            cartItems[i].count = cartItems[i].count! + 1;
            break;
          }
      }

    if(addedBefore == false)
      {
        cartItems.add(item);
      }
  }

  // void addToCartFromDetails(item )
  // {
  //   cartItems.add(item);
  //   emit(AddToCartFromDetailsChange());
  //
  // }


  void incrementItemCount()
  {
    emit(AddCountChange());
  }

  void subtract()
  {
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

  List productsFromCategories=[];
  void addProductsFromCategories(value){
    productsFromCategories.add(value);
    emit(AddProductsFromCategoriesChange());

  }

  bool obscureText=true;
  IconData icon =Icons.visibility_off_sharp;
  bool isShowBottom=false;
  void isShowBottomLogin({required bool show}){
    isShowBottom=show;
    emit(IsShowBottomChange());

  }

  void showPassword({required bool obscureText}){
    this.obscureText=!obscureText;
    emit(ShowPasswordChange());
  }
  String erorrText= '[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.';
  void showError(String error){
    if(erorrText==error){
      erorrText='password or email is wrong';
      emit(ErrorLoginChange());

    }
    String erorrTextSingUp= '[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.';
    void showErrorSingUp(String error){
      if(erorrTextSingUp==error){
        erorrTextSingUp='email ';
        emit(ErrorSingUpChange());

      }
  }
  }

  void setCurrentIndex (int newIndex)
  {
    currentIndex = newIndex;
    emit(NewCurrentIndexChange());
  }

}
