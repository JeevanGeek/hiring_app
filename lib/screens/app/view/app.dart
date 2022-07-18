import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/routes/app_route.dart';
import 'package:hiring_app/screens/auth/auth.dart';
import 'package:hiring_app/utils/strings.dart';

class HiringApp extends StatelessWidget {
  const HiringApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
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
        ),
      ),
    );
  }
}
