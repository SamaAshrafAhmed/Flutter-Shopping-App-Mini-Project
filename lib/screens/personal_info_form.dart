import 'package:first_flutter_project/models/personal_info.dart';
import 'package:first_flutter_project/screens/personal_info_screen.dart';
import 'package:first_flutter_project/services/personal_details_service.dart';
import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    TextEditingController nameCtrl = TextEditingController();
    TextEditingController ageCtrl = TextEditingController();
    TextEditingController hobbyCtrl = TextEditingController();

    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: InputDecoration(label: Text(l10n.name)),
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: ageCtrl,
                decoration: InputDecoration(label: Text(l10n.age)),
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: hobbyCtrl,
                decoration: InputDecoration(label: Text(l10n.favouriteHobby)),
              ),
              const SizedBox(height: 30),
              FilledButton(
                onPressed: () {
                  // Store the submitted personal information in Firestore.
                  PersonalDetailsService.instance.addPersonalInfo(
                    PersonalInfo(
                      name: nameCtrl.text,
                      age: double.parse(ageCtrl.text),
                      favouriteHobby: hobbyCtrl.text,
                    ),
                  );
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(l10n.dataSaved)));
                },
                style: TextButton.styleFrom(fixedSize: const Size(200, 10)),
                child: Text(l10n.saveData),
              ),
              const SizedBox(height: 15),

              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PersonalInfoScreen();
                      },
                    ),
                  );
                },
                style: TextButton.styleFrom(fixedSize: const Size(200, 10)),
                child: Text(l10n.displayData),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
