import 'package:flutter/material.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/auth/auth.dart';
import 'package:hiring_app/screens/home/home.dart';
import 'package:hiring_app/screens/welcome/welcome.dart';

class AppRoute {
  AppRoute._();

  static String initialRoute = Routes.loading;

  static Map<String, WidgetBuilder> routes = {
    Routes.loading: (context) => const LoadingPage(),
    Routes.onboarding: (context) => const OnboardingView(),
    Routes.home: (context) => const HomePage(),
    Routes.register: (context) => const RegisterView(),
    Routes.login: (context) => const LoginView(),
    Routes.forgotPassword: (context) => const ForgotPasswordView(),
    Routes.profile: (context) => const ProfileView(),
  };
}
