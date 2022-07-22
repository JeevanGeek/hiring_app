import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/screens/auth/auth.dart';
import 'package:hiring_app/utils/colors.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';
import 'package:hiring_app/utils/validator.dart';
import 'package:hiring_app/widgets/buttons.dart';
import 'package:hiring_app/widgets/dialogs.dart';
import 'package:hiring_app/widgets/widgets.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is EmailSent) {
            Dialogs.snackBar(context, state.message);
            Navigator.pop(context);
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
                    (value) => value.forgotKey,
                  ),
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
                      SizedBox(height: AppConstants.x6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          PrimaryButton(
                            onPressed: () {
                              final key = context.read<AuthBloc>().forgotKey;
                              if (key.currentState?.validate() ?? false) {
                                context
                                    .read<AuthBloc>()
                                    .add(const UserForgot());
                              }
                            },
                            child: BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                return (state is AuthLoading)
                                    ? const Loader()
                                    : Text(
                                        AppStrings.submit,
                                        textAlign: TextAlign.center,
                                        style: AppStyles.primary9Regular16,
                                      );
                              },
                            ),
                          ),
                          SizedBox(height: AppConstants.x4),
                          SecondaryButton(
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
        ),
      ),
    );
  }
}
