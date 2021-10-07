import 'package:amit_shop/shard/shard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count =1;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Stack(
              alignment: Alignment.bottomCenter,
            children:[
              ListView.separated(
                physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Row(

                          children:
                          [
                            Image(image: NetworkImage('${Shard.cartItems[index].avatar}'),height: size.height*.15,width: size.width*.3,fit: BoxFit.fill,),
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
                                         setState(() {
                                           Shard.cartItems.remove(Shard.cartItems[index]);
                                         });
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
                                    '${Shard.cartItems[index].title}',
                                    style: TextStyle(
                                        fontSize: size.height * .02,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: size.height*.01,),
                                  Text(
                                    '${Shard.cartItems[index].name} ',
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
                                          '${Shard.cartItems[index].price} EGP',
                                          style: TextStyle(
                                              fontSize: size.height * .023, color: Colors.red),
                                        ),
                                      ),
                                      SizedBox(width: size.width*.1,),
                                      MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              count--;
                                            });
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
                                        child: Text(' $count ',style: TextStyle(fontSize: size.height*.025),),
                                      ),
                                      SizedBox(width: size.width*.01,),
                                      MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            count++;
                                          });
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
                  itemCount:Shard.cartItems.length),
              Expanded(

                child: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.end ,

                  children: [
                    InkWell(
                      onTap :(){
                        setState(() {
                          Shard.cartItems.clear();
                        });
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
