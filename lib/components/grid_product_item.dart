import 'package:first_flutter_project/components/add_to_cart_button.dart';
import 'package:first_flutter_project/components/product_image.dart';
import 'package:first_flutter_project/components/product_name_text.dart';
import 'package:first_flutter_project/components/product_price.dart';
import 'package:first_flutter_project/models/product.dart';
import 'package:flutter/material.dart';

class GridProductItem extends StatelessWidget {
  const GridProductItem({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: const Color(0xFFD8D8D8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductImage(
              imageUrl: product.imageUrl,
              height: MediaQuery.of(context).size.width < 600 ? 120 : 240,
              width: double.infinity,
              radius: 10.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ProductNameText(productName: product.name),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ProductPrice(price: product.price.toStringAsFixed(2)),
              ),
              AddToCartButton(),
            ],
          ),
        ],
      ),
    );
  }
}
