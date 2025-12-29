import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Cart is empty! Browse in the shop to discover our items.',
            style: TextStyle(fontFamily: 'Georgia'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(160, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.grey[600], // Background color
              foregroundColor: Colors.white70, // Text Color
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/shop');
            },
            child: Text('Go for shopping!'),
          ),
        ],
      ),
    );
  }
}
