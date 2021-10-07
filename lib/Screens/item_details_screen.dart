import 'package:amit_shop/models/productsVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  Product selectedItem;
   ItemDetails({required this.selectedItem});



  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int count =1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Container(
              height:size.height*.35 ,
              width:double.infinity,
              decoration: BoxDecoration(
                  image:DecorationImage(image: NetworkImage('${widget.selectedItem.avatar}'),fit: BoxFit.fill)
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.selectedItem.title}',
                    style: TextStyle(
                        fontSize: size.height * .04,
                        fontWeight: FontWeight.w400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: size.height*.01,),
                  Text(
                    '${widget.selectedItem.name}',
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
                        '${widget.selectedItem.price} EGP',
                        style: TextStyle(
                            fontSize: size.height * .023, color: Colors.red),
                      ),
                      SizedBox(width: size.width*.29,),
                      MaterialButton(
                          onPressed: () {
                            setState(() {
                              count--;
                            });
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
                        child: Text(' $count ',style: TextStyle(fontSize: size.height*.025),),
                      ),
                      SizedBox(width: size.width*.02,),
                      MaterialButton(
                          onPressed: () {
                            setState(() {
                              count++;
                            });
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
                    '${widget.selectedItem.description}',
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
                  onPressed: () {},
                  color: Colors.red[700],
                  height: size.height * .05,
                  minWidth: size.width*.85,
                  child:Text('Add to cart',style: TextStyle(color: Colors.white,fontSize: size.width*.05),),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
