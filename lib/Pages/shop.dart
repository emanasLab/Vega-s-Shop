//flutters
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//providers
import 'package:shop/Features/Stock/StockData/stock_provider.dart';
//UIs
import 'package:shop/Features/Ads/AdsUi/ad.dart';
import 'package:shop/Features/Stock/StockUi/shop_product.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access stock data
    //final stockData = context.watch<StockProvider>().products; //we changed Product State in only 2 containers, why to rebuild the whole page(declaring stockdata here)
    return Scaffold(
      //**************Archi **************//
      //appBar ( brand name + cart icon )
      //adds section (no providers needed)
      //categories (no providers needed)
      //new arrivals (list of items from stock provider)
      //for you (list of items from stock provider)
      backgroundColor: const Color(0xFFFFFFFF),
      //should get updated
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        //centerTitle: true,
        title: Text(
          'Vega\'s Shop',
          style: TextStyle(fontFamily: 'Georgia', fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/intro');
          },
          icon: Icon(Icons.exit_to_app),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            //ads section
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Ad(
                    path: 'photos/ad$index.jpg',
                  ); //i is the add number, which defines it's path (in imgs i have ad0.jpg,...)
                },
              ),
            ),

            SizedBox(height: 10),

            //New Arrivals
            //title
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'New Arrivals',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia',
                ),
              ),
            ),
            //list
            Container(
              height: 350,
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Consumer<StockProvider>(
                builder: (context, stock, child) => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: stock.newArrivals.length,
                  itemBuilder: (context, index) {
                    final p = stock.newArrivals[index];
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ShopProduct(product: p),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                ),
              ),
            ),
            SizedBox(height: 20),

            //For You
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'For You',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 350,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Consumer<StockProvider>(
                builder: (context, stock1, child) => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: stock1.forYou.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ShopProduct(product: stock1.forYou[index]),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
