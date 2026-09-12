import 'package:firebase_core/firebase_core.dart';
import 'package:first_flutter_project/firebase_options.dart';
import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:first_flutter_project/screens/login_screen.dart';
import 'package:first_flutter_project/screens/personal_info_form.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Configure Firebase before the app uses Authentication or Firestore.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: LoginPage(),
    );
  }
}
