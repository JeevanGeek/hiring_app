import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/auth/auth.dart';
import 'package:hiring_app/screens/home/home.dart';
import 'package:hiring_app/services/db.dart';
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
            context.read<HomeCubit>().selectedIndex = 0;
          } else if (state is AuthError) {
            Dialogs.snackBar(context, state.message.toString());
          }
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(AppConstants.x4),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: AppConstants.x6,
                      backgroundImage:
                          NetworkImage(Db().profile?.get(AppConstants.avatar)),
                    ),
                    SizedBox(height: AppConstants.x4),
                    Text(
                      Db().profile?.get(AppConstants.name),
                      style: AppStyles.primary2Bold25,
                    ),
                    SizedBox(height: AppConstants.x4),
                    if (Db().isCandidate)
                      const CandidateProfile()
                    else if (Db().isRecruiter)
                      const RecruiterProfile(),
                    SizedBox(height: AppConstants.x5),
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
                          return (state is AuthLoading)
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
                          return (state is AuthLoading)
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
        ),
      ),
    );
  }
}

class RecruiterProfile extends StatelessWidget {
  const RecruiterProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Leading(AppStrings.email),
          trailing: Trailing(Db().profile?.get(AppConstants.email)),
        ),
        ListTile(
          leading: const Leading(AppStrings.phone),
          trailing: Trailing(Db().profile?.get(AppConstants.phone)),
        ),
        ListTile(
          leading: const Leading(AppStrings.sector),
          trailing: Trailing(Db().profile?.get(AppConstants.sector)),
        ),
        ListTile(
          leading: const Leading(AppStrings.employees),
          trailing: Trailing(Db().profile?.get(AppConstants.employees)),
        ),
        ListTile(
          leading: const Leading(AppStrings.city),
          trailing: Trailing(Db().profile?.get(AppConstants.city)),
        ),
        ListTile(
          leading: const Leading(AppStrings.website),
          trailing: Trailing(Db().profile?.get(AppConstants.website)),
        ),
      ],
    );
  }
}

class CandidateProfile extends StatelessWidget {
  const CandidateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Leading(AppStrings.email),
          trailing: Trailing(Db().profile?.get(AppConstants.email)),
        ),
        ListTile(
          leading: const Leading(AppStrings.phone),
          trailing: Trailing(Db().profile?.get(AppConstants.phone)),
        ),
        ListTile(
          leading: const Leading(AppStrings.iAm),
          trailing: Trailing(Db().profile?.get(AppConstants.iAm)),
        ),
        ListTile(
          leading: const Leading(AppStrings.gender),
          trailing: Trailing(Db().profile?.get(AppConstants.gender)),
        ),
        ListTile(
          leading: const Leading(AppStrings.city),
          trailing: Trailing(Db().profile?.get(AppConstants.city)),
        ),
        ListTile(
          leading: const Leading(AppStrings.dob),
          trailing: Trailing(Db().profile?.get(AppConstants.dob)),
        ),
      ],
    );
  }
}
