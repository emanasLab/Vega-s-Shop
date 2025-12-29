import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Features/Cart/CartData/cart_provider.dart';
import 'package:shop/Components/product.dart';

class CartSummary extends StatelessWidget {
  final List<Product> curCart;
  const CartSummary({super.key, required this.curCart});
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final totalPrice = context.read<CartProvider>().calculateTotal(
      cart.cartItems,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Total'),
              Text(
                '\$${totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(150, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.grey[600], // Background color
              foregroundColor: Colors.white70, // Text Color
            ),
            onPressed: cart.cartItems.isEmpty
                ? null
                : () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Text('This feature is in mantenance still'),
                        actions: [
                          MaterialButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Ok"),
                          ),
                        ],
                      ),
                    );
                  },

            child: const Text('Confirm Order'),
          ),
        ],
      ),
    );
  }
}
