import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiring_app/services/auth.dart';
import 'package:hiring_app/services/services.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';

class Db {
  Db._();
  static final Db _instance = Db._();
  static Db get instance => _instance;
  factory Db() => _instance;

  User? get auth => Auth().auth;

  CollectionReference<Map<String, dynamic>> get usersCollection =>
      FirebaseFirestore.instance.collection(AppConstants.users);
  CollectionReference<Map<String, dynamic>> get jobsCollection =>
      FirebaseFirestore.instance.collection(AppConstants.jobs);

  DocumentReference<Map<String, dynamic>> get user =>
      usersCollection.doc(auth?.email);
  DocumentSnapshot<Map<String, dynamic>>? profile;
  List<QueryDocumentSnapshot<Map<String, dynamic>>> allJobs = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> jobs = [];

  bool get isUserExists =>
      profile?.data()?.containsKey(AppConstants.role) ?? false;
  bool get isProfileExists =>
      profile?.data()?.containsKey(AppConstants.name) ?? false;
  bool get isCandidate =>
      Db().profile?.get(AppConstants.role) == AppStrings.candidate;
  bool get isRecruiter =>
      Db().profile?.get(AppConstants.role) == AppStrings.recruiter;

  Future<void> addUser(String role, String email) async {
    try {
      await user.set({
        AppConstants.role: role,
        AppConstants.email: email,
        AppConstants.isActive: true,
        AppConstants.createdAt: DateTime.now().toString(),
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
      await user.update({
        AppConstants.name: name,
        AppConstants.phone: phone,
        AppConstants.iAm: iAm,
        AppConstants.gender: gender,
        AppConstants.city: city,
        AppConstants.dob: dob,
        AppConstants.avatar: Services.getAvatar(name),
        AppConstants.updatedAt: DateTime.now().toString(),
      });
    } catch (_) {
      rethrow;
    }
  }

  Future<void> setRecruiterProfile(
    String name,
    String phone,
    String sector,
    String employees,
    String city,
    String website,
  ) async {
    try {
      await user.update({
        AppConstants.name: name,
        AppConstants.phone: phone,
        AppConstants.sector: sector,
        AppConstants.employees: employees,
        AppConstants.city: city,
        AppConstants.website: website,
        AppConstants.avatar: Services.getAvatar(name),
        AppConstants.updatedAt: DateTime.now().toString(),
      });
    } catch (_) {
      rethrow;
    }
  }

  Future<void> addJob(
    String title,
    String jobType,
    String jobCulture,
    String payRange,
    String location,
    String description,
  ) async {
    try {
      final id = Services.getId;
      final data = {
        AppConstants.name: profile?.get(AppConstants.name),
        AppConstants.sector: profile?.get(AppConstants.sector),
        AppConstants.employees: profile?.get(AppConstants.employees),
        AppConstants.website: profile?.get(AppConstants.website),
        AppConstants.avatar: profile?.get(AppConstants.avatar),
        AppConstants.jobTitle: title,
        AppConstants.jobType: jobType,
        AppConstants.jobCulture: jobCulture,
        AppConstants.jobPayRange: payRange,
        AppConstants.jobLocation: location,
        AppConstants.jobDescription: description,
        AppConstants.addedAt: DateTime.now().toString(),
      };
      await user.collection(AppConstants.jobs).doc(id).set(data);
      await jobsCollection.doc(id).set(data);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getProfile() async {
    profile = await user.get();
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getAllJobs() async {
    allJobs = (await jobsCollection.get()).docs;
    return allJobs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getJobs() async {
    jobs = (await user.collection(AppConstants.jobs).get()).docs;
    return jobs;
  }
}
