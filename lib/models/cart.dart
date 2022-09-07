import 'package:catalogapp/models/catalog_product.dart';

class CartModel {
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
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
