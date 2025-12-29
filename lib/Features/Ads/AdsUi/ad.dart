import 'package:flutter/material.dart';

class Ad extends StatelessWidget {
  //final int i;
  final String path;
  const Ad({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(path), //image: AssetImage(path)
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
