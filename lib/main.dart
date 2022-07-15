import 'package:flutter/material.dart';
import 'package:hiring_app/screens/app/app.dart';
import 'package:hiring_app/utils/storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage.init();
  runApp(const HiringApp());
}
