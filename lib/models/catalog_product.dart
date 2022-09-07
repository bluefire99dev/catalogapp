class CatalogModel {
  static List<Item> items = [];

// cart.dart mathi copy kayru
//  cart ma product add karva
  static final catModel = CatalogModel._internal();
  //
  CatalogModel._internal();
  //
  factory CatalogModel() => catModel;

  //= [
  //   Item(
  //     id: 1,
  //     name: "iPhone 12 Pro",
  //     desc: "Apple iPhone 12th generation",
  //     price: 999,
  //     color: "#33505a",
  //     image:
  //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc",
  //   ),
  // ];

  //get Item by id
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //get Item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

// encode the json file
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  // decode

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}
