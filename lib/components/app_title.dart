import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    // Reuse this style for the section titles on the app screens.
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Suwannaphum',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFA52489),
      ),
    );
  }
}
