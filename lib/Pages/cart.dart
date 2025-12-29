import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Features/Cart/CartUi/empty_part.dart';
import 'package:shop/Features/Cart/CartUi/cart_product.dart';
import 'package:shop/Features/Cart/CartData/cart_provider.dart';
import 'package:shop/Features/Cart/CartUi/cart_summary.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cartItems;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/shop');
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Cart',
          style: TextStyle(fontFamily: 'Georgia', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: SizedBox(child: CartSummary(curCart: cart)),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          final cart = cartProvider.cartItems;

          if (cart.isEmpty) {
            return EmptyCart();
          }
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: cart.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CartProduct(i: index, item: cart[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
          );
        },
      ),
    );
  }
}
