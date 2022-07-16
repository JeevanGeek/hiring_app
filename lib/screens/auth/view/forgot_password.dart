import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/screens/auth/auth.dart';
import 'package:hiring_app/utils/colors.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const ForgotPasswordView(),
    );
  }
}

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

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
                    Icons.lock_rounded,
                    size: AppConstants.x7,
                    color: AppColors.primary1,
                  ),
                  SizedBox(height: AppConstants.x5),
                  Text(
                    AppStrings.forgotPassword,
                    style: AppStyles.primary2Bold25,
                  ),
                  SizedBox(height: AppConstants.x5),
                  Text(
                    '${AppStrings.provideYourEmail}\n${AppStrings.youWillGetLink}',
                    style: AppStyles.blackRegular15,
                  ),
                  SizedBox(height: AppConstants.x6),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: AppStrings.emailExample,
                      labelText: AppStrings.email,
                    ),
                  ),
                  SizedBox(height: AppConstants.x6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.submit,
                          textAlign: TextAlign.center,
                          style: AppStyles.primary9Regular16,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppStrings.goBack,
                          textAlign: TextAlign.center,
                          style: AppStyles.primary1Regular16,
                        ),
                      ),
                    ],
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
