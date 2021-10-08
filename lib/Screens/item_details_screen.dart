import 'package:amit_shop/cubit/cubit.dart';
import 'package:amit_shop/cubit/stats.dart';
import 'package:amit_shop/models/productsVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetails extends StatelessWidget {
  Product selectedItem;
   ItemDetails({required this.selectedItem});

  int count =1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: BlocProvider(
        create: (BuildContext context)=>AppCubit(),
        child: BlocConsumer<AppCubit,AppStats>(
          listener: (context,stats){},
          builder: (context,stats){
            return Scaffold(
              backgroundColor: Colors.white,
              body:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Container(
                    height:size.height*.35 ,
                    width:double.infinity,
                    decoration: BoxDecoration(
                        image:DecorationImage(image: NetworkImage('${selectedItem.avatar}'),fit: BoxFit.fill)
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${selectedItem.title}',
                          style: TextStyle(
                              fontSize: size.height * .04,
                              fontWeight: FontWeight.w400),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: size.height*.01,),
                        Text(
                          '${selectedItem.name}',
                          style: TextStyle(
                            fontSize: size.height * .025,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: size.height*.02,),
                        Container(
                          height: size.width*.006,
                          width: double.infinity,
                          color: Colors.black,
                        ),
                        SizedBox(height: size.height*.02,),
                        Row(
                          children: [
                            Text(
                              '${selectedItem.price} EGP',
                              style: TextStyle(
                                  fontSize: size.height * .023, color: Colors.red),
                            ),
                            SizedBox(width: size.width*.29,),
                            MaterialButton(
                                onPressed: () {
                                  AppCubit.get(context).subtract(selectedItem.count);
                                },
                                color: Colors.red[700],
                                height: size.height * .03,
                                minWidth: size.width * .09,
                                child: Icon(Icons.remove,color: Colors.white,)),
                            SizedBox(width: size.width*.02,),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,),
                              ),
                              child: Text(' ${selectedItem.count} ',style: TextStyle(fontSize: size.height*.025),),
                            ),
                            SizedBox(width: size.width*.02,),
                            MaterialButton(
                                onPressed: () {
                                  AppCubit.get(context).add(selectedItem.count);
                                },
                                color: Colors.red[700],
                                height: size.height * .03,
                                minWidth: size.width * .09,
                                child: Icon(Icons.add,color: Colors.white,)),
                          ],
                        ),
                        SizedBox(height: size.height*.02,),
                        Container(
                          height: size.width*.006,
                          width: double.infinity,
                          color: Colors.black,
                        ),
                        SizedBox(height: size.height*.03,),
                        Text(
                          '${selectedItem.description}',
                          style: TextStyle(
                            fontSize: size.height * .025,

                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),

                      ],
                    ),
                  ),
                  Center(
                    child: MaterialButton(
                      onPressed: () {

                        AppCubit.get(context).addToCartFromDetails(selectedItem);
                      },
                      color: Colors.red[700],
                      height: size.height * .05,
                      minWidth: size.width*.85,
                      child:Text('Add to cart',style: TextStyle(color: Colors.white,fontSize: size.width*.05),),
                    ),
                  ),


                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


