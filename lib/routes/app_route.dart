import 'package:flutter/material.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/home/home.dart';
import 'package:hiring_app/screens/loading/loading.dart';
import 'package:hiring_app/screens/onboarding/onboarding.dart';

class AppRoute {
  AppRoute._();

  static String initialRoute = Routes.loading;

  static Map<String, WidgetBuilder> routes = {
    Routes.loading: (context) => const LoadingPage(),
    Routes.onboarding: (context) => const OnboardingPage(),
    Routes.home: (context) => const HomePage(),
  };
}
