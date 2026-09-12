import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter_project/models/personal_info.dart';

class PersonalDetailsService {
  PersonalDetailsService._();
  static final PersonalDetailsService instance = PersonalDetailsService._();
  final _db = FirebaseFirestore.instance;

  get db => _db;

  Future<void> addPersonalInfo(PersonalInfo data) async {
    await _db.collection("UserInfo").add(data.toFirestore());
  }

  Future<List<PersonalInfo>> getPersonalInfo() async {
    final snap = await _db.collection('users').get();
    return snap.docs.map((d) => PersonalInfo.fromFirestore(d)).toList();
  }
}
