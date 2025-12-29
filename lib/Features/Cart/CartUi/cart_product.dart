import 'package:flutter/material.dart';
import 'package:shop/Components/product.dart';
import 'package:shop/Features/Cart/CartData/cart_provider.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatelessWidget {
  final int i;
  final Product item;
  const CartProduct({super.key, required this.i, required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //image
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(item.imagePath), //'photos/bag1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //Name and details\
            SizedBox(
              width: 300,
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0, top: 0),
                    child: ListTile(
                      //
                      title: Text(
                        item.name, //'Stylish Bag',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        item.description,
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text(
                                'Are you sure of removing this item from the Cart?',
                              ),
                              actions: [
                                MaterialButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("No"),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    return context
                                        .read<CartProvider>()
                                        .removeFromCart(item);
                                  },
                                  child: Text("Yes"),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.delete_outline),
                      ),
                    ),
                  ),
                  // Consumer<CartProvider>(
                  //
                  //
                  //  builder: (build, cart, child) => Text(
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Text(
                              '\$${item.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () => context
                                      .read<CartProvider>()
                                      .decreaseQte(item),
                                  icon: Icon(Icons.remove),
                                ),
                                Text('|  ', style: TextStyle(fontSize: 18)),
                                Text(
                                  '${item.qte}',
                                  //'\$100.00',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('  |', style: TextStyle(fontSize: 18)),
                                IconButton(
                                  onPressed: () => context
                                      .read<CartProvider>()
                                      .incrementQte(item),
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //price and Quantity
          ],
        ),
      ),
    );
  }
}
