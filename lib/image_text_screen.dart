import 'package:first_flutter_project/components/custom_text.dart';
import 'package:first_flutter_project/components/images_row.dart';
import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ImageTextScreen extends StatelessWidget {
  const ImageTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC7A0BF),
        title: Text(AppLocalizations.of(context)!.firstProjectTitle),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: ImagesRowWidget(
              assetsImagePath: 'assets/images/asset_photo.jpg',
              networkImageUrl:
                  'https://t4.ftcdn.net/jpg/14/64/22/71/360_F_1464227120_NAaeukTQE6JKY98w5xmjvAtW4vQa4DSJ.jpg',
            ),
          ),
          SizedBox(height: 20),
          CustomText(text: AppLocalizations.of(context)!.imagesDisplayed),
        ],
      ),
    );
  }
}
