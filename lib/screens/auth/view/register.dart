import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/auth/auth.dart';
import 'package:hiring_app/utils/colors.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const RegisterView(),
    );
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

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
                    Icons.app_registration_rounded,
                    size: AppConstants.x7,
                    color: AppColors.primary1,
                  ),
                  SizedBox(height: AppConstants.x5),
                  Text(
                    AppStrings.register,
                    style: AppStyles.primary2Bold25,
                  ),
                  SizedBox(height: AppConstants.x4),
                  Text(
                    '${AppStrings.welcomeToApp}\n${AppStrings.pleaseRegister}',
                    style: AppStyles.blackRegular15,
                  ),
                  SizedBox(height: AppConstants.x4),
                  Row(
                    children: [
                      Text(
                        AppStrings.alreadyHaveAccount,
                        style: AppStyles.greyRegular14,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.signIn);
                        },
                        child: const Text(AppStrings.signIn),
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
                  const TextField(
                    decoration: InputDecoration(
                      hintText: AppStrings.enterPassword,
                      labelText: AppStrings.confirmPassword,
                    ),
                  ),
                  SizedBox(height: AppConstants.x5),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.register,
                      textAlign: TextAlign.center,
                      style: AppStyles.primary9Regular16,
                    ),
                  ),
                  SizedBox(height: AppConstants.x4),
                  Text(
                    AppStrings.agreeTermsAndConditions,
                    style: AppStyles.greyRegular14,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
