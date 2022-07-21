import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Auth._();
  static final Auth _instance = Auth._();
  static Auth get instance => _instance;
  factory Auth() => _instance;

  User? get auth => FirebaseAuth.instance.currentUser;
  bool get isLoggedIn => auth != null;

  Future<void> register(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> forgot(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> delete() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();
    } catch (_) {
      rethrow;
    }
  }
}
