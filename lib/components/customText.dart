import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontFamily: 'Suwannaphum', fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFFA52489)));
  }
}