// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog_product.dart';

class AddTOCart extends StatefulWidget {
  final Item catalog;
  const AddTOCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddTOCart> createState() => _AddTOCartState();
}

class _AddTOCartState extends State<AddTOCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.item.contains(widget.catalog);

    return ElevatedButton(
      onPressed: () {
        //item return add ni thase if thi
        if (!isInCart) {
          isInCart = isInCart.toggle();
          //cart ma add karva
          final _catalog = CatalogModel();
          //
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
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
