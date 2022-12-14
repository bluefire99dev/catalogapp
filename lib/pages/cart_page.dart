// import 'package:catalogapp/widgets/themes.dart';
// import 'package:flutter/cupertino.dart';
import 'package:catalogapp/core/store.dart';
import 'package:catalogapp/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "cart".text.make(),
      ),
      body: Column(
        children: [
          _cartList().p32().expand(),
          Divider(),
          _cartTotal(),
        ],
      ),
    );
  }
}

class _cartTotal extends StatelessWidget {
  _cartTotal({Key? key}) : super(key: key);
  @override
  // final _cart = CartModel();
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //price plus minus karva vsconsumer
          VxConsumer(
            builder: (context, store, status) {
              return "\$${_cart.totalprice}"
                  .text
                  .xl5
                  .color(context.theme.accentColor)
                  .make();
            },
            mutations: {RemoveMutation},
            notifications: {},
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "buying is not supported yet".text.make(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.buttonColor),
            ),
            child: "buy".text.white.make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class _cartList extends StatelessWidget {
  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.item.isEmpty
        ? "nothing to show".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.item.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  RemoveMutation(_cart.item[index]);
                  //item remove karva
                  // _cart.remove(_cart.item[index]);
                  // setState(() {});
                },
              ),
              title: _cart.item[index].name.text.make(),
            ),
          );
  }
}
