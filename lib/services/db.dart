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
        AppConstants.id: id,
        AppConstants.email: profile?.get(AppConstants.email),
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
        AppConstants.isApplied: false,
        AppConstants.addedAt: DateTime.now().toString(),
      };
      await user.collection(AppConstants.jobs).doc(id).set(data);
      await jobsCollection.doc(id).set(data);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> addApplication(
    QueryDocumentSnapshot<Map<String, dynamic>> job,
    String coverLetter,
  ) async {
    await user
        .collection(AppConstants.jobs)
        .doc(job.get(AppConstants.id))
        .set(job.data());
    await user
        .collection(AppConstants.jobs)
        .doc(job.get(AppConstants.id))
        .update({AppConstants.isApplied: true});
    await usersCollection
        .doc(job.get(AppConstants.email))
        .collection(AppConstants.jobs)
        .doc(job.get(AppConstants.id))
        .update({AppConstants.applicants: true});
    await usersCollection
        .doc(job.get(AppConstants.email))
        .collection(AppConstants.jobs)
        .doc(job.get(AppConstants.id))
        .collection(AppConstants.applicants)
        .doc(auth?.email)
        .set(profile?.data() ?? {});
    await usersCollection
        .doc(job.get(AppConstants.email))
        .collection(AppConstants.jobs)
        .doc(job.get(AppConstants.id))
        .collection(AppConstants.applicants)
        .doc(auth?.email)
        .update({
      AppConstants.coverLetter: coverLetter,
      AppConstants.appliedAt: DateTime.now().toString(),
    });
  }

  Future<void> getProfile() async {
    profile = await user.get();
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCandidateJobs() async {
    return (await jobsCollection.get()).docs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getRecruiterJobs() async {
    return (await user.collection(AppConstants.jobs).get()).docs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCandidateApplications() async {
    return (await user.collection(AppConstants.jobs).get()).docs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getRecruiterApplications() async {
    return (await user.collection(AppConstants.jobs).get())
        .docs
        .where((element) => element.data().containsKey(AppConstants.applicants))
        .toList();
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getApplicants(
      String id) async {
    return (await user
            .collection(AppConstants.jobs)
            .doc(id)
            .collection(AppConstants.applicants)
            .get())
        .docs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> searchJobs(
      String query) async {
    return (await jobsCollection.get())
        .docs
        .where((element) => element
            .get(AppConstants.jobTitle)
            .toString()
            .toUpperCase()
            .contains(query.toUpperCase()))
        .toList();
  }
}
