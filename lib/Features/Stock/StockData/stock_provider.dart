import 'package:flutter/material.dart';
import 'package:shop/Components/product.dart';

//SHOP PRODUCTS STOCK
class StockProvider extends ChangeNotifier {
  final List<Product> newArrivals = [
    Product(
      name: "Polene Bag",
      description: "Stylish and Trendy Bag!",
      price: 99.00,
      imagePath: "photos/bag1.jpg",
    ),
    Product(
      name: "Leather Bag",
      description: "Elegant Leather Bag!",
      price: 20.00,
      imagePath: "photos/sweater.jpg",
    ),
    Product(
      name: "Casual Bag",
      description: "Perfect for Daily Use!",
      price: 80.00,
      imagePath: "photos/bag3.jpg",
    ),
    Product(
      name: "Boho Bag",
      description: "Perfect for Uni days",
      price: 52.99,
      imagePath: "photos/bag4.jpg",
    ),
  ];

  // final List<Product> forYou = [
  //   Product(
  //     name: name,
  //     description: description,
  //     price: price,
  //     qte: qte,
  //     imagePath: imagePath,
  //   ),
  //   Product(
  //     name: name,
  //     description: description,
  //     price: price,
  //     qte: qte,
  //     imagePath: imagePath,
  //   ),
  // ];

  Product getProduct(int i) {
    return newArrivals[i];
  }
}
