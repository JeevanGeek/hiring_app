import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/auth/auth.dart';
import 'package:hiring_app/utils/colors.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const SignInView(),
    );
  }
}

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.all(AppConstants.x4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.login_rounded,
                    size: AppConstants.x7,
                    color: AppColors.primary1,
                  ),
                  SizedBox(height: AppConstants.x5),
                  Text(
                    AppStrings.signIn,
                    style: AppStyles.primary2Bold25,
                  ),
                  SizedBox(height: AppConstants.x4),
                  Text(
                    '${AppStrings.welcomeToApp}\n${AppStrings.pleaseSignIn}',
                    style: AppStyles.blackRegular15,
                  ),
                  SizedBox(height: AppConstants.x4),
                  Row(
                    children: [
                      Text(
                        AppStrings.dontHaveAccount,
                        style: AppStyles.greyRegular14,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.register);
                        },
                        child: const Text(AppStrings.register),
                      )
                    ],
                  ),
                  SizedBox(height: AppConstants.x4),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: AppStrings.emailExample,
                      labelText: AppStrings.email,
                    ),
                  ),
                  SizedBox(height: AppConstants.x4),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: AppStrings.enterPassword,
                      labelText: AppStrings.password,
                    ),
                  ),
                  SizedBox(height: AppConstants.x4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.forgotPassword);
                      },
                      child: const Text(AppStrings.forgotPassword),
                    ),
                  ),
                  SizedBox(height: AppConstants.x4),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.signIn,
                      textAlign: TextAlign.center,
                      style: AppStyles.primary9Regular16,
                    ),
                  ),
                  SizedBox(height: AppConstants.x4),
                  Text(
                    AppStrings.agreeTermsAndConditions,
                    style: AppStyles.greyRegular14,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
