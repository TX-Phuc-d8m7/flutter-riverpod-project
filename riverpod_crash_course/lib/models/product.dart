class Product {
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    this.description,
    this.type,
  });

  final String id;
  final String title;
  final int price;
  final String image;
  final String? type;
  final String? description;
}
