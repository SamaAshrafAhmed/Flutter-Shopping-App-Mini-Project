import 'package:first_flutter_project/components/customText.dart';
import 'package:first_flutter_project/components/imagesRow.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFC7A0BF),
          title: const Text('My First Project'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: ImagesRowWidget(
                assetsImagePath: 'assets/images/asset_photo.jpg',
                networkImageUrl: 'https://t4.ftcdn.net/jpg/14/64/22/71/360_F_1464227120_NAaeukTQE6JKY98w5xmjvAtW4vQa4DSJ.jpg',
              ),
            ),
            SizedBox(height: 20),
            CustomText(text: 'The two images are displayed'),
          ],
                )
      ),
    );
  }

 }


