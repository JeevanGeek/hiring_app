import 'package:flutter/material.dart';
import 'package:hiring_app/routes/app_route.dart';
import 'package:hiring_app/utils/strings.dart';

class HiringApp extends StatelessWidget {
  const HiringApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      routes: AppRoute.routes,
      initialRoute: AppRoute.initialRoute,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Helvetica',
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}
