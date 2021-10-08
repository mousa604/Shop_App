import 'package:amit_shop/cubit/cubit.dart';
import 'package:amit_shop/cubit/stats.dart';
import 'package:amit_shop/logic/API.dart';
import 'package:amit_shop/models/productsVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottm_navvigtion_screen.dart';
import 'categories_screen.dart';
import 'item_details_screen.dart';

// ignore: must_be_immutable
class ProductsScreen extends StatelessWidget {
  late int categoriesId ;
  ProductsScreen({required this.categoriesId});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (BuildContext context) =>AppCubit(),
      child: BlocConsumer<AppCubit,AppStats>(
        listener: (context,stats){},
        builder: (context,stats){
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>BottomNavigtionScreen() ));
                },),
              title: Text('Products'),
              centerTitle: true,
            ),
            backgroundColor: Colors.white70,
            body:FutureBuilder<ProductsVm>(
              future: API.getProducts(),
              builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.done) {
                  return GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: size.width * .01,
                      crossAxisSpacing: size.width * .01,
                      padding: EdgeInsets.only(top: size.height * .01),
                      children:List.generate(snapshot.data!.products!.length, (index) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: InkWell(
                                    onTap: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>ItemDetails(selectedItem: snapshot.data!.products![index],)) );
                                    },
                                    child: Image(
                                      image: NetworkImage('${snapshot.data!.products![index].avatar}'),
                                      fit: BoxFit.fill,
                                      width: size.width * .5,
                                      height: size.height * .5,
                                    ))),
                            Text(
                              '\t\t${snapshot.data!.products![index].title}',
                              style: TextStyle(
                                  fontSize: size.height * .02,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '\t\t${snapshot.data!.products![index].name}',
                              style: TextStyle(
                                fontSize: size.height * .02,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MaterialButton(
                                    onPressed: () {

                                      AppCubit.get(context).addToCart(snapshot.data!.products![index]);
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
                                  '${snapshot.data!.products![index].price} EGP',
                                  style: TextStyle(
                                      fontSize: size.height * .023, color: Colors.red),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),)
                  );
                }else
                  return Center(child: CircularProgressIndicator());
              },
            ),
          );
        },
      ),
    );
  }
}
