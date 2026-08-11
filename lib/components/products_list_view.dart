import 'package:first_flutter_project/components/product_image.dart';
import 'package:first_flutter_project/components/product_name_text.dart';
import 'package:first_flutter_project/components/product_price.dart';
import 'package:first_flutter_project/models/product.dart';
import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 850,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 10),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                child: Row(
                  children: [
                    Expanded(
                      child: ProductImage(
                        imageUrl: product.imageUrl,
                        radius: 10.0,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProductNameText(productName: product.name),
                          const SizedBox(height: 5),
                          ProductPrice(price: product.price.toStringAsFixed(2)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
