// import 'package:flutter/cupertino.dart';
import 'package:catalogapp/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalog_product.dart';

class AddTOCart extends StatelessWidget {
  final Item catalog;
  const AddTOCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    // VxState.listen(context, to: [AddMutation], );
    VxState.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.item.contains(catalog);

    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    return ElevatedButton(
      onPressed: () {
        //item return add ni thase if thi
        if (!isInCart) {
          // isInCart = isInCart.toggle();
          //cart ma add karva
          // final _catalog = CatalogModel();
          //
          // _cart.catalog = _catalog;
          AddMutation(catalog);
          // setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
