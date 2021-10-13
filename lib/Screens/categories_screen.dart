import 'package:amit_shop/Screens/products_from_categories_screen.dart';
import 'package:amit_shop/logic/API.dart';
import 'package:amit_shop/models/categoriesVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Categories',style: TextStyle(color: Colors.black,fontSize: 25),),

          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(icon: Icon(Icons.search,color: Colors.black,size: 30,), onPressed: () {  },),
            ),

          ],
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder<CategoriesVm>(
          future: API.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: size.width * .03,
                    crossAxisSpacing: size.width * .03,
                    children: List.generate(
                      snapshot.data!.categories!.length,
                      (index) => Container(
                        decoration:BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.grey,),
                          boxShadow: [
                            BoxShadow(color: Colors.black54,spreadRadius:1,blurRadius: 1,)
                          ],

                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>ProductsScreen(categoryId: snapshot.data!.categories![index].id,
                              categoryName: snapshot.data!.categories![index].name,)) );
                          },
                          child: Stack(
                            children: [
                              Image(
                                image: NetworkImage(
                                    '${snapshot.data!.categories![index].avatar}'),
                                fit: BoxFit.fill,
                                width: size.width * .5,
                                height: size.height * .5,
                              ),
                              Center(
                                child: Container(
                                    color: Colors.black.withOpacity(.5),
                                    child: Text(
                                      '${snapshot.data!.categories![index].name}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * .06),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              );
            } else
              return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
