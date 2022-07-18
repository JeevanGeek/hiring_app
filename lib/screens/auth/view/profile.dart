import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/auth/auth.dart';
import 'package:hiring_app/services/auth.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';
import 'package:hiring_app/widgets/buttons.dart';
import 'package:hiring_app/widgets/dialogs.dart';
import 'package:hiring_app/widgets/widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoggedOut || state is UserDeleted) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.onboarding,
              (route) => false,
            );
          } else if (state is ShowError) {
            Dialogs.snackBar(context, state.message.toString());
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppConstants.x4),
            child: Column(
              children: [
                CircleAvatar(
                  radius: AppConstants.x5,
                  child: const Icon(Icons.person),
                ),
                SizedBox(height: AppConstants.x5),
                Text(
                  Auth().user.email,
                  style: AppStyles.primary2Bold25,
                ),
                const Spacer(),
                PrimaryButton(
                  onPressed: () {
                    Dialogs.alertDialog(
                      context,
                      title: AppStrings.sureToLogout,
                      onYes: () {
                        context.read<AuthBloc>().add(const UserLogout());
                      },
                      onNo: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return (state is Loading)
                          ? const Loader()
                          : Text(
                              AppStrings.logout,
                              textAlign: TextAlign.center,
                              style: AppStyles.primary9Regular16,
                            );
                    },
                  ),
                ),
                SizedBox(height: AppConstants.x4),
                SecondaryButton(
                  onPressed: () {
                    Dialogs.alertDialog(
                      context,
                      title: AppStrings.sureToDelete,
                      subtitle: AppStrings.actionIrreversible,
                      onYes: () {
                        context.read<AuthBloc>().add(const UserDelete());
                      },
                      onNo: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return (state is Loading)
                          ? const Loader()
                          : Text(
                              AppStrings.deleteAccount,
                              textAlign: TextAlign.center,
                              style: AppStyles.redBold16,
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
