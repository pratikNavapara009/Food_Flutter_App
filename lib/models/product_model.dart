class Product {
  final int? id;
  final String? name;
  final String? image;
  final int? price;
  late final int quantity;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  factory Product.fromMap({required Product data}) {
    return Product(
      id: data.id,
      name: data.name,
      image: data.image,
      quantity: data.quantity,
      price: data.price,
    );
  }
}

class ProductDB {
  final int? id;
  final String? name;
  final String? image;
    final int? price;
  late final int quantity;

  ProductDB({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  factory ProductDB.fromMap({required Map data}) {
    return ProductDB(
      id: data['id'],
      name: data['name'],
      image: data['image'],
      price: data['price'],
      quantity: data['quantity'],
    );
  }
}
