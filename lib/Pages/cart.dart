import 'package:flutter/material.dart';
import 'package:shop/Features/Cart/CartUi/cart_product.dart';
import 'package:shop/Features/Cart/CartData/cart_provider.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  @override
  Widget build(BuildContext context) {
    //final stockData = context.watch<CartProvider>().cartItems;
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
      body: SingleChildScrollView(
        child: Consumer<CartProvider>(
          builder: (builder, cart, child) => ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: cart.cartItems.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CartProduct(i: index, item: cart.cartItems[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
          ),
        ),
      ),
    );
  }
}
