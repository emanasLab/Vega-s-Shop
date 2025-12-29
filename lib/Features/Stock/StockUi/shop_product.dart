//Flutters
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Providers
import 'package:shop/Features/Cart/CartData/cart_provider.dart';
//Components
import 'package:shop/Components/product.dart';

class ShopProduct extends StatelessWidget {
  final Product product;
  final bool found = false;
  const ShopProduct({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFA4A4A4), width: 1.0),
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //image + Title + description
          SizedBox(
            child: Column(
              children: [
                //image
                Container(
                  height: 200,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      //************changable: item img url********//
                      image: AssetImage(product.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //name
                Container(
                  margin: EdgeInsets.only(right: 5, left: 5),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    //************ changable: item name ***********// //product.name
                    product.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Georgia',
                    ),
                  ),
                ),
                //description
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 6),
                  margin: EdgeInsets.only(right: 5, left: 5, bottom: 5),
                  child: Text(
                    product.description,
                    style: TextStyle(fontSize: 12, fontFamily: 'Georgia'),
                  ),
                ),
              ],
            ),
          ),

          //price + add to cart cart button
          Container(
            padding: EdgeInsets.only(left: 8),
            //height: 45,
            decoration: BoxDecoration(
              color: const Color.fromARGB(79, 158, 158, 158),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  //************changable: item price********//
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Georgia',
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(80, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.grey[600], // Background color
                    foregroundColor: Colors.white70, // Text Color
                  ),
                  onPressed: () {
                    print(product.qte);
                    //add to cart function from provider to insure the function will notifyListeners
                    //if product already in cart just add quantity
                    //else add new product to cart
                    if (product.qte == 0) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text('Item was added Successfully!'),
                          actions: [
                            MaterialButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Ok"),
                            ),
                          ],
                        ),
                      );
                    }
                    context.read<CartProvider>().addToCart(
                      product,
                      found,
                      product.qte,
                    );
                  },
                  child: Icon(Icons.add_shopping_cart_outlined, size: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
