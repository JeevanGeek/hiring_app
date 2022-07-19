import 'package:flutter/material.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/auth/auth.dart';
import 'package:hiring_app/screens/candidate/candidate.dart';
import 'package:hiring_app/screens/recruiter/recruiter.dart';
import 'package:hiring_app/screens/welcome/welcome.dart';
import 'package:hiring_app/utils/storage.dart';
import 'package:hiring_app/utils/strings.dart';

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
      switch (Storage.getRole()) {
        case AppStrings.candidate:
          return const CandidatePage();
        case AppStrings.recruiter:
          return const RecruiterPage();
        default:
          return const OnboardingView();
      }
    },
    Routes.profile: (context) => const ProfileView(),
  };
}
