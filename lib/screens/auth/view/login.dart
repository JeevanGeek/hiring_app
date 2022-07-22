import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/auth/auth.dart';
import 'package:hiring_app/utils/colors.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';
import 'package:hiring_app/utils/validator.dart';
import 'package:hiring_app/widgets/buttons.dart';
import 'package:hiring_app/widgets/dialogs.dart';
import 'package:hiring_app/widgets/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoggedIn) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
              (route) => false,
            );
          } else if (state is AuthError) {
            Dialogs.snackBar(context, state.message.toString());
          }
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: EdgeInsets.all(AppConstants.x4),
                child: Form(
                  key: context.select<AuthBloc, GlobalKey<FormState>>(
                    (value) => value.loginKey,
                  ),
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
                        AppStrings.login,
                        style: AppStyles.primary2Bold25,
                      ),
                      SizedBox(height: AppConstants.x4),
                      Text(
                        '${AppStrings.welcomeToApp}\n${AppStrings.pleaseLogin}',
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
                                context,
                                Routes.register,
                              );
                            },
                            child: const Text(AppStrings.register),
                          )
                        ],
                      ),
                      SizedBox(height: AppConstants.x4),
                      TextFormField(
                        controller:
                            context.select<AuthBloc, TextEditingController>(
                          (value) => value.emailController,
                        ),
                        validator: (value) => Validator.validate(value),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: AppStrings.emailExample,
                          labelText: AppStrings.email,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      TextFormField(
                        controller:
                            context.select<AuthBloc, TextEditingController>(
                          (value) => value.passwordController,
                        ),
                        validator: (value) => Validator.validate(value),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          hintText: AppStrings.enterPassword,
                          labelText: AppStrings.password,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Routes.forgotPassword,
                            );
                          },
                          child: const Text(AppStrings.forgotPassword),
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      PrimaryButton(
                        onPressed: () {
                          final key = context.read<AuthBloc>().loginKey;
                          if (key.currentState?.validate() ?? false) {
                            context.read<AuthBloc>().add(const UserLogin());
                          }
                        },
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return (state is AuthLoading)
                                ? const Loader()
                                : Text(
                                    AppStrings.login,
                                    textAlign: TextAlign.center,
                                    style: AppStyles.primary9Regular16,
                                  );
                          },
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
        ),
      ),
    );
  }
}
