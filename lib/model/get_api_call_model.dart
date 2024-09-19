class Cart {
  final int id;
  final int userId;
  final List<CategoryModel> products;
  final double total;

  Cart({
    required this.id,
    required this.userId,
    required this.products,
    required this.total,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    var productsList = json['products'] as List;
    List<CategoryModel> products =
        productsList.map((i) => CategoryModel.fromJson(i)).toList();

    return Cart(
      id: json['id'],
      userId: json['userId'],
      products: products,
      total: json['total'].toDouble(),
    );
  }
}

class CategoryModel {
  final int id;
  final int quantity;

  CategoryModel({
    required this.id,
    required this.quantity,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      quantity: json['quantity'],
    );
  }

  get isLoading => null;

  get carts => null;
}
