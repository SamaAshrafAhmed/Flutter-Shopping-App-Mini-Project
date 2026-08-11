import 'package:flutter/material.dart';

class AddToCartButtton extends StatelessWidget {
  const AddToCartButtton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
          color: Color(0xFFC7A0BF),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: IconButton(
          iconSize: 15,
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            // Handle favorite button press
          },
        ),
      ),
    );
  }
}
