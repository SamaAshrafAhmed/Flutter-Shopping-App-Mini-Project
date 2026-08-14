import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

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
          icon: const Icon(Icons.add_shopping_cart),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Color(0xFF5F4C5B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                content: Text("Item added to the cart"),
              ),
            );
          },
        ),
      ),
    );
  }
}
