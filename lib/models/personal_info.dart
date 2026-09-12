import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalInfo {
  final String name;
  final double age;
  final String favouriteHobby;

  PersonalInfo({
    required this.name,
    required this.age,
    required this.favouriteHobby,
  });

  factory PersonalInfo.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return PersonalInfo(
      name: data?['name'],
      age: data?['age'],
      favouriteHobby: data?['hobby'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {"name": name, "age": age, "hobby": favouriteHobby};
  }
}
