import 'package:flutter/material.dart';

class ImagesRowWidget extends StatelessWidget {
  const ImagesRowWidget({
    super.key,
    required this.assetsImagePath,
    required this.networkImageUrl,
  });

  final String assetsImagePath;
  final String networkImageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          assetsImagePath,
          width: MediaQuery.of(context).size.width * 0.5 - 10,
          height: 200,
        ),
        Spacer(),
        Image.network(
          networkImageUrl,
          width: MediaQuery.of(context).size.width * 0.5 - 10,
          height: 200,
        ),
      ],
    );
  }
}
