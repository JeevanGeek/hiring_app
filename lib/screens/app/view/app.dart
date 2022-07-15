import 'package:flutter/material.dart';
import 'package:hiring_app/routes/app_route.dart';
import 'package:hiring_app/utils/colors.dart';
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
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(16.0),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.primary2),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(16.0),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.primary9),
          ),
        ),
      ),
    );
  }
}
