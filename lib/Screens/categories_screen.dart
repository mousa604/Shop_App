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
        backgroundColor: Colors.grey,
        body: FutureBuilder<CategoriesVm>(
          future: API.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: size.width * .03,
                  crossAxisSpacing: size.width * .03,
                  children: List.generate(
                    snapshot.data!.categories!.length,
                    (index) => Stack(
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
                                    fontSize: size.width * .07),
                              )),
                        )
                      ],
                    ),
                  ));
            } else
              return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
