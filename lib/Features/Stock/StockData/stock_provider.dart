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

  final List<Product> forYou = [
    Product(
      name: "Brown Balerina",
      description: "Brown Balerina for daily wear",
      price: 20.00,
      imagePath: "photos/shoe0.jpg",
    ),
    Product(
      name: "Pink Cute Sweater",
      description: "The pink sweater you need for your favorite days",
      price: 29.99,
      imagePath: "photos/sweater0.jpg",
    ),
    Product(
      name: "Grey Long Coat",
      description: "Long Coat of wool you need for your cold days",
      price: 59.99,
      imagePath: "photos/coat0.jpg",
    ),
  ];

  Product getProduct(int i) {
    return newArrivals[i];
  }
}
