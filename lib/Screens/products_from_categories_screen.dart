import 'package:amit_shop/cubit/cubit.dart';
import 'package:amit_shop/cubit/stats.dart';
import 'package:amit_shop/logic/API.dart';
import 'package:amit_shop/models/productsVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_navigation_screen.dart';
import 'categories_screen.dart';
import 'item_details_screen.dart';

// ignore: must_be_immutable
class ProductsScreen extends StatelessWidget {
  late int? categoryId;
  late String? categoryName;
  ProductsScreen({required this.categoryId, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStats>(
        listener: (context, stats) {},
        builder: (context, stats) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: ()
                {
                  print(" AppCubit.get(context).currentIndex ");
                  print( AppCubit.get(context).currentIndex );
                 // AppCubit.get(context).setCurrentIndex(1);
                  AppCubit.get(context).changeCurrentIndex(1);
                  print(" AppCubit.get(context).currentIndex ");
                  print( AppCubit.get(context).currentIndex );
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigtionScreen()));
                },
              ),
              title: Text('Products of $categoryName'),
              centerTitle: true,
            ),
            backgroundColor: Colors.white70,
            body: FutureBuilder<ProductsVm>(
              future: API.getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) 
                {
                  List<Product> productsList =  snapshot.data!.products!.where((element) => (categoryId == element.categoryId)).toList();
                  return GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: size.width * .01,
                      crossAxisSpacing: size.width * .01,
                      padding: EdgeInsets.only(top: size.height * .01),
                      children: List.generate(
                        productsList.length,
                        (index) => Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ItemDetails(
                                                      selectedItem: productsList[index],
                                                    )));
                                      },
                                      child: Image(
                                        image: NetworkImage(
                                            '${productsList[index].avatar}'),
                                        fit: BoxFit.fill,
                                        width: size.width * .5,
                                        height: size.height * .5,
                                      ))),
                              Text(
                                '\t\t${productsList[index].title}',
                                style: TextStyle(
                                    fontSize: size.height * .02,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '\t\t${productsList[index].name}',
                                style: TextStyle(
                                  fontSize: size.height * .02,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  MaterialButton(
                                      onPressed: () {
                                        if(productsList[index].count == null)
                                        {
                                          productsList[index].count = 1;
                                        }
                                        else
                                        {
                                          productsList[index].count = (productsList[index].count! + 1);
                                        }
                                        AppCubit.get(context).addToCart(productsList[index]);
                                      },
                                      color: Colors.red[700],
                                      height: size.height * .03,
                                      minWidth: size.width * .09,
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: size.height * .025),
                                      )),
                                  Text(
                                    '${productsList[index].price} EGP',
                                    style: TextStyle(
                                        fontSize: size.height * .023,
                                        color: Colors.red),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ));
                } else
                  return Center(child: CircularProgressIndicator());
              },
            ),
          );
        },
      ),
    );
  }
}
