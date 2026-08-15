import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:first_flutter_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app includes ARB localization support', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.supportedLocales, contains(const Locale('en')));
    expect(materialApp.supportedLocales, contains(const Locale('ar')));

    expect(
      find.text(
        AppLocalizations.of(tester.element(find.byType(MaterialApp)))!.signUp,
      ),
      findsOneWidget,
    );
  });
}
