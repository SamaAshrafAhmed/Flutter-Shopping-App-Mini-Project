import 'package:flutter/material.dart';

class CustomShopppingLabel extends StatelessWidget {
  const CustomShopppingLabel({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Suwannaphum',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFA52489),
        ),
      ),
    );
  }
}
