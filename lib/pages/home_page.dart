import 'dart:convert';
import 'package:catalogapp/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalogapp/models/catalog_product.dart';
import '../models/catalog_product.dart';
import '../widgets/home_widgets/Catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
// import 'home_widgets/Catalog_header.dart';
// import 'home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // homepage({Key? key}) : super(key: key);
  double days = 30;
  String name = "neel";

// json file leva
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData(); // loadData method chhee json/ punspec.ymal ma assets/files
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    var catalogjson = await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogjson);
    var decodeData = jsonDecode(catalogjson);
    // print(catalogjson);
    var productData = decodeData["products"];
    // print(productData);
    CatalogModel.items =
        List.from(productData).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // step:1:- bo badha dummy iphone banavse
    // final dummyList = List.generate(4, ((index) => CatalogModel.items[0]));

    return Scaffold(
      //if we can not use the velocity x
      // backgroundColor: Theme.of(context).canvasColor,
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartroute);
        },
        backgroundColor: context.theme.buttonColor,
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}








//4:40 : time
//5:14 : time
//5:23:36 time
// 5:38:14 time hero tag end use for animation 
// 5:47:  day18 completed
// 6:14:56

