import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter_project/models/personal_info.dart';
import 'package:first_flutter_project/services/personal_details_service.dart';
import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: StreamBuilder<List<PersonalInfo>>(
        // Stream personal information changes directly from Firestore.
        stream: PersonalDetailsService.instance.db
            .collection('UserInfo')
            .snapshots()
            .map<List<PersonalInfo>>((
              QuerySnapshot<Map<String, dynamic>> data,
            ) {
              return data.docs.map<PersonalInfo>((
                QueryDocumentSnapshot<Map<String, dynamic>> doc,
              ) {
                return PersonalInfo.fromFirestore(doc);
              }).toList();
            }),
        builder: (c, snap) {
          if (!snap.hasData) return Center(child: CircularProgressIndicator());
          return ListView(
            children: snap.data!
                .map(
                  (userInfo) => ListTile(
                    title: Text(userInfo.name),
                    subtitle: Text('${l10n.hobby}: ${userInfo.favouriteHobby}'),
                    trailing: Text('${l10n.age}: ${userInfo.age}'),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
