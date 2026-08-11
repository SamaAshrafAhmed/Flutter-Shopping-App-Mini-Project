import 'package:first_flutter_project/components/pageView_item.dart';
import 'package:flutter/material.dart';

class ProductsPageView extends StatelessWidget {
  const ProductsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewProductItem(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsYF7PT8Dc5jGayF-TQD4BN-t3WhwBN1a7y3xSaFlF9g&s=10',
        ),
        PageViewProductItem(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYlIaTbIQzMbhyuo8y_RrqZDjgqU4Z3EYAb5MHvg5nZg&s',
        ),
        PageViewProductItem(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKrM3nKSNNz_TfmQKTflByzgIEnH_pPcWZU77v83LfOg&s=10',
        ),
      ],
    );
  }
}
