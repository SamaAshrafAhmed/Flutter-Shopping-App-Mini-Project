
import 'package:flutter/material.dart';

class ProductNameText extends StatelessWidget {
  const ProductNameText({
    super.key,
    required this.productName,
  });
final String productName;
  @override
  Widget build(BuildContext context) {
    return Text(
      productName,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontFamily: 'Suwannaphum',
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333),
      ),
    );
  }
}
