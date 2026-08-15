import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$price ${AppLocalizations.of(context)!.eGP}',
      style: const TextStyle(
        fontFamily: 'Suwannaphum',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Color(0xFFA52489),
      ),
    );
  }
}
