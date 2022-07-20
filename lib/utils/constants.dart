import 'dart:math';

import 'package:hiring_app/utils/size_config.dart';

class AppConstants {
  AppConstants._();

  static double x0 = min(1.0.toHeight, 1.0.toWidth);
  static double x1 = min(2.0.toHeight, 2.0.toWidth);
  static double x2 = min(4.0.toHeight, 4.0.toWidth);
  static double x3 = min(8.0.toHeight, 8.0.toWidth);
  static double x4 = min(16.0.toHeight, 16.0.toWidth);
  static double x5 = min(32.0.toHeight, 32.0.toWidth);
  static double x6 = min(64.0.toHeight, 64.0.toWidth);
  static double x7 = min(128.0.toHeight, 128.0.toWidth);
  static double x8 = min(256.0.toHeight, 256.0.toWidth);
  static double x9 = min(512.0.toHeight, 512.0.toWidth);

  static const String role = 'role';
  static const String email = 'email';
  static const String isActive = 'isActive';
  static const String createdAt = 'createdAt';
  static const String name = 'name';
  static const String phone = 'phone';
  static const String iAm = 'iAm';
  static const String gender = 'gender';
  static const String city = 'city';
  static const String dob = 'dob';
  static const String updatedAt = 'updatedAt';
  static const String sector = 'sector';
  static const String company = 'company';
  static const String website = 'website';
  static const String users = 'users';
}
