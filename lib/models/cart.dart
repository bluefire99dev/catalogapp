import 'package:catalogapp/models/catalog_product.dart';
import 'package:catalogapp/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // singletan 7:03:34 time codepur
  // catalog_product ma pan add kayru name chang karinne
  //  cart ma product add karva
  // static final cartModel = CartModel._internal();
  //
  // CartModel._internal();
  //
  // factory CartModel() => cartModel;

  // catalog field
  late CatalogModel _catalog;

// collection of ids -store ids of each item
  final List<int> _itemIds = [];

// get catalog
  CatalogModel get catalog => _catalog;

//
  set catalog(CatalogModel newcatalog) {
    assert(newcatalog != null);
    _catalog = newcatalog;
  }

  // get items in the cart
  List<Item> get item => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalprice => item.fold(0, (total, current) => total + current.price);

  // add item
  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

  // remove item
  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}

//add item
class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

//remove item
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
