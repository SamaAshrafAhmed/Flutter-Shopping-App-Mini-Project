import 'package:first_flutter_project/components/custom_grid_vew.dart';
import 'package:first_flutter_project/components/custom_shopping_label.dart';
import 'package:first_flutter_project/components/products_list_view.dart';
import 'package:first_flutter_project/components/products_pageView.dart';
import 'package:first_flutter_project/models/product.dart';
import 'package:flutter/material.dart';

class ShoppingScreen extends StatelessWidget {
  ShoppingScreen({super.key});
  final List<Product> products = [
    Product(
      name: 'Lily Bouquet',
      imageUrl:
          'https://floward.imgix.net/web/Files/thumPro/3e762347-77b5-41d0-8760-8cf0b8e3ee9c.jpg?w=550&h=550&fit=crop&auto=format,compress',
      price: 169.99,
    ),
    Product(
      name: 'Purple Bouquet',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjqj15LHJgzd8qPBG5ihObQux-IEQzti1KiTyCvjFuPA&s=10',
      price: 129.99,
    ),
    Product(
      name: 'Crochet Bouquet',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtOQtZ0K8A6Co69BBJ4Xz9hejcqDA44c0YcHJp-tH2R9G15SNhasyPXKM&s=10',
      price: 149.99,
    ),
    Product(
      name: 'Purple Tulip',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo-LexZspydE6Nh3Lq4G8gEVQxxExq0KrAYF5vaHP8Iq3xWUySdiP-DL0v&s=10',
      price: 139.99,
    ),
    Product(
      name: 'Orchid Flower',
      imageUrl:
          'https://m.media-amazon.com/images/I/71Xskl7o6GL._AC_UF894,1000_QL80_.jpg',
      price: 179.99,
    ),
    Product(
      name: 'Daisy Flower',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMyPaIrBN6YpaAnpdEiAM5hjZOUFkSupiJ3kFTLeDMADv5toYjspJZnyk&s=10',
      price: 129.99,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC7A0BF),
        title: const Text(
          'Products',
          style: TextStyle(
            fontFamily: 'Suwannaphum',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF722964),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CustomShopppingLabel(text: 'Our Products'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: width < 600 ? 200 : 400,
              child: ProductsPageView(products: products),
            ),
          ),
          SizedBox(height: 10),
          ProductsGridView(products: products),
          CustomShopppingLabel(text: 'Hot Offers'),
          SizedBox(height: 10),
          ProductsListView(products: products),
        ],
      ),
    );
  }
}
