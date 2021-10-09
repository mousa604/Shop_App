import 'package:amit_shop/cubit/cubit.dart';
import 'package:amit_shop/cubit/stats.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return SafeArea(
      child: BlocConsumer<AppCubit,AppStats>(
        listener: (context,stats){},
        builder: (context,stats){
          AppCubit cubit =AppCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(

                children:[
                  Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              Row(

                                children:
                                [
                                  Image(image: NetworkImage('${AppCubit.cartItems[index].avatar}'),height: size.height*.15,width: size.width*.3,fit: BoxFit.fill,),
                                  SizedBox(width: 10,),
                                  Expanded(

                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(''),
                                            InkWell(
                                              onTap: (){

                                                cubit.removeItem(AppCubit.cartItems[index]);
                                              },
                                              child: CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor: Colors.grey,
                                                  child: Icon(Icons.close,color: Colors.white,size: 17,)
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          '${AppCubit.cartItems[index].title}',
                                          style: TextStyle(
                                              fontSize: size.height * .02,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: size.height*.01,),
                                        Text(
                                          '${AppCubit.cartItems[index].name} ',
                                          style: TextStyle(
                                            fontSize: size.height * .02,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: size.width*.08,),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${AppCubit.cartItems[index].price} EGP',
                                                style: TextStyle(
                                                    fontSize: size.height * .023, color: Colors.red),
                                              ),
                                            ),
                                            SizedBox(width: size.width*.1,),
                                            MaterialButton(
                                                onPressed: ()
                                                {
                                                  if(AppCubit.cartItems[index].count! > 1 )
                                                  {
                                                    AppCubit.cartItems[index].count = AppCubit.cartItems[index].count! - 1;
                                                    cubit.subtract();
                                                  }
                                                },
                                                color: Colors.red[700],
                                                height: size.height * .01,
                                                minWidth: size.width * .01,
                                                child:  Text('-',style: TextStyle(color: Colors.white,fontSize: size.width*.04),)
                                            ),
                                            SizedBox(width: size.width*.02,),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey,),
                                              ),
                                              child: Text('${AppCubit.cartItems[index].count}',style: TextStyle(fontSize: size.height*.025),),
                                            ),
                                            SizedBox(width: size.width*.01,),
                                            MaterialButton(
                                              onPressed: ()
                                              {
                                                AppCubit.cartItems[index].count = AppCubit.cartItems[index].count! + 1;
                                                cubit.incrementItemCount();
                                              },
                                              color: Colors.red[700],
                                              height: size.height * .01,
                                              minWidth: size.width * .01,
                                              child: Text('+',style: TextStyle(color: Colors.white,fontSize: size.width*.04),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height*.03,),
                              Container(
                                height: size.width*.002,
                                width: double.infinity,
                                color: Colors.grey,
                              ),


                            ],
                          );
                        },
                        separatorBuilder: (context,index){
                          return SizedBox(height: size.height*.03,);
                        },
                        itemCount:AppCubit.cartItems.length),
                  ),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:CrossAxisAlignment.end ,

                    children: [
                      InkWell(
                        onTap :(){
                         cubit.clearCart();
                        },
                        child: Container(
                          width: size.width*.35,
                          height: size.height*.06,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.grey,),
                            boxShadow: [
                              BoxShadow(color: Colors.black54,spreadRadius:1,blurRadius: 3,)
                            ],

                          ),
                          child: Center(child: Text('Clear Cart',style: TextStyle(color: Colors.red[700],fontWeight: FontWeight.w600),)),
                        ),
                      ),
                      SizedBox(width: size.width*.06,),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: size.width*.35,
                          height: size.height*.06,
                          decoration: BoxDecoration(
                            color: Colors.red[700],
                            borderRadius: BorderRadius.circular(7),

                          ),
                          child: Center(child: Text('Go to Checkout',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


