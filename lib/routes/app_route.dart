import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/auth/auth.dart';
import 'package:hiring_app/screens/candidate/candidate.dart';
import 'package:hiring_app/screens/home/home.dart';
import 'package:hiring_app/screens/recruiter/recruiter.dart';
import 'package:hiring_app/screens/welcome/welcome.dart';
import 'package:hiring_app/services/db.dart';

class AppRoute {
  AppRoute._();

  static String initialRoute = Routes.loading;

  static Map<String, WidgetBuilder> routes = {
    Routes.loading: (context) => const LoadingPage(),
    Routes.onboarding: (context) => const OnboardingView(),
    Routes.register: (context) => const RegisterView(),
    Routes.login: (context) => const LoginView(),
    Routes.forgotPassword: (context) => const ForgotPasswordView(),
    Routes.home: (context) {
      if (Db().isUserExists) {
        if (Db().isProfileExists) {
          return const HomePage();
        }
        if (Db().isCandidate) {
          return const CandidateEditView();
        } else if (Db().isRecruiter) {
          return const RecruiterEditView();
        }
      }
      return const OnboardingView();
    },
    Routes.profile: (context) => const ProfileView(),
    Routes.newJob: (context) => const NewJobView(),
    Routes.jobDetails: (context) {
      final job = ModalRoute.of(context)?.settings.arguments
          as QueryDocumentSnapshot<Map<String, dynamic>>;
      return JobDetailsView(job: job);
    },
    Routes.jobApplicants: (context) {
      final job = ModalRoute.of(context)?.settings.arguments
          as QueryDocumentSnapshot<Map<String, dynamic>>;
      return JobApplicantsPage(job: job);
    },
    Routes.applicantDetails: (context) {
      final applicant = ModalRoute.of(context)?.settings.arguments
          as QueryDocumentSnapshot<Map<String, dynamic>>;
      return ApplicantDetailsView(applicant: applicant);
    },
  };
}
