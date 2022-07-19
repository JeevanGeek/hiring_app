import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiring_app/services/auth.dart';

class Db {
  Db._();
  static final Db _instance = Db._();
  static Db get instance => _instance;
  factory Db() => _instance;

  User? get user => Auth().user;
  DocumentReference<Map<String, dynamic>> get db =>
      FirebaseFirestore.instance.collection('users').doc(user?.email);

  Future<void> addUser(String role) async {
    try {
      await db.set({
        'role': role,
        'is_active': true,
        'created_at': DateTime.now(),
      });
    } catch (_) {
      rethrow;
    }
  }

  Future<String> getRole() async {
    return (await db.get()).get('role');
  }
}
