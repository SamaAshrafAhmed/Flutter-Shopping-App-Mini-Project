import 'package:first_flutter_project/models/product.dart';
import 'package:flutter/material.dart';

class ProductsPageView extends StatelessWidget {
  const ProductsPageView({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: List.generate(products.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(products[index].imageUrl, fit: BoxFit.cover),
          ),
        );
      }),
    );
  }
}
