class Product {
  final String name;
  final String description;
  final double price;
  int qte = 0;
  final String imagePath;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}
