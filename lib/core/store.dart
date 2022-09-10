import 'package:catalogapp/models/cart.dart';
import 'package:catalogapp/models/catalog_product.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:catalogapp/core/store.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
