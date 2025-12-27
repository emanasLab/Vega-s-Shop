import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.shopify, size: 85, color: Colors.brown[900]),
            // SizedBox(height: 15),
            //Name
            Text(
              "Vega's Shop",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.brown[900],
                fontFamily: 'Serif',
              ),
            ),

            //Slogan
            Text(
              "so you can carry your world.",
              style: TextStyle(
                fontFamily: 'Serif',
                fontSize: 20,
                color: const Color.fromARGB(176, 93, 64, 55),
              ),
            ),
            //button
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                fixedSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/shop',
                ); //used the local path with Navigator
              },

              child: Text(
                "Get Started!",
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontWeight: FontWeight
                      .w400, //btw w600 works better than bold in buttons
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
