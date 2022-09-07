import 'package:flutter/material.dart';
import 'package:catalogapp/models/catalog_product.dart';

class ItemWIdget extends StatelessWidget {
  final Item item;

  const ItemWIdget({super.key, required this.item});

  //error nichenu code use kare to beacuse null safty
  // const ItemWIdget({Key key, @required this.item})
  //     : assert(item != item),
  //       super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Color.fromARGB(255, 243, 165, 199),
      // shape: const StadiumBorder(),
      // elevation: 0.0,
      child: ListTile(
        onTap: () {
          // print("${item.name} pressed....");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price.toString()}",
          textScaleFactor: 1.2,
          style: const TextStyle(
              color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
