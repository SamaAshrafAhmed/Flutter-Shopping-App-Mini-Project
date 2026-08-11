import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$price EGP',
      style: TextStyle(
        fontFamily: 'Suwannaphum',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFA52489),
      ),
    );
  }
}
