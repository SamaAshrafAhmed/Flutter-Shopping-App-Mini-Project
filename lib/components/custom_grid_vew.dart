import 'package:first_flutter_project/components/grid_product_item.dart';
import 'package:first_flutter_project/models/product.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    // Fixed height keeps the grid stable inside the scroll view.
    return SizedBox(
      height: 600,
      child: GridView(
        //no scrolling for the grid view, it will be scrolled by the main scroll view
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 10.0,
        ),
        children: List.generate(products.length, (index) {
          return GridProductItem(product: products[index]);
        }),
      ),
    );
  }
}
