// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catalogapp/models/cart.dart';
import 'package:catalogapp/pages/home_detail_page.dart';
//  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog_product.dart';
// import '../../widgets/themes.dart';
// import '../home_page.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];

        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailsPage(catalog: catalog),
                    // builder: (context) => HomeDetailsPage(
                    //   catalog: CatalogModel.getById(2),
                  ),
                ),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

//CatalogItem
class CatalogItem extends StatelessWidget {
  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(context.accentColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                8.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    //1. eveluted button widget extract kayru
                    // 2._AddToCart() ne statfull banayvu
                    _AddTOCart(catalog: catalog)
                  ],
                ).pOnly(right: 8.0)
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class _AddTOCart extends StatefulWidget {
  final Item catalog;
  const _AddTOCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_AddTOCart> createState() => _AddTOCartState();
}

class _AddTOCartState extends State<_AddTOCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        //cart ma add karva
        final _catalog = CatalogModel();
        final _cart = CartModel();
        //
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isAdded ? Icon(Icons.done) : "Add To Cart".text.make(),
    );
  }
}
