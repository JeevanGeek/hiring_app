import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiring_app/services/auth.dart';
import 'package:hiring_app/services/avatar.dart';
import 'package:hiring_app/utils/constants.dart';

class Db {
  Db._();
  static final Db _instance = Db._();
  static Db get instance => _instance;
  factory Db() => _instance;

  User? get user => Auth().user;
  DocumentReference<Map<String, dynamic>> get db => FirebaseFirestore.instance
      .collection(AppConstants.users)
      .doc(user?.email);
  DocumentSnapshot<Map<String, dynamic>>? profile;
  bool get isUserExists =>
      profile?.data()?.containsKey(AppConstants.role) ?? false;
  bool get isProfileExists =>
      profile?.data()?.containsKey(AppConstants.name) ?? false;

  Future<void> addUser(String role, String email) async {
    try {
      await db.set({
        AppConstants.role: role,
        AppConstants.email: email,
        AppConstants.isActive: true,
        AppConstants.createdAt: DateTime.now(),
      });
    } catch (_) {
      rethrow;
    }
  }

  Future<void> setCandidateProfile(
    String name,
    String phone,
    String iAm,
    String gender,
    String city,
    String dob,
  ) async {
    try {
      await db.update({
        AppConstants.name: name,
        AppConstants.phone: phone,
        AppConstants.iAm: iAm,
        AppConstants.gender: gender,
        AppConstants.city: city,
        AppConstants.dob: dob,
        AppConstants.updatedAt: DateTime.now(),
      });
      await user?.updateDisplayName(name);
      await user?.updatePhotoURL(Avatar.getAvatar(name));
    } catch (_) {
      rethrow;
    }
  }

  Future<void> setRecruiterProfile(
    String name,
    String phone,
    String sector,
    String company,
    String city,
    String website,
  ) async {
    try {
      await db.update({
        AppConstants.name: name,
        AppConstants.phone: phone,
        AppConstants.sector: sector,
        AppConstants.company: company,
        AppConstants.city: city,
        AppConstants.website: website,
        AppConstants.updatedAt: DateTime.now(),
      });
      await user?.updateDisplayName(name);
      await user?.updatePhotoURL(Avatar.getAvatar(name));
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getProfile() async {
    profile = await db.get();
  }
}
