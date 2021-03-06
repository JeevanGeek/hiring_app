import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hiring_app/firebase_options.dart';
import 'package:hiring_app/screens/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const HiringApp());
}
