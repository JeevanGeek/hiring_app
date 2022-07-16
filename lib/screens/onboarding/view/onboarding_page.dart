import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/onboarding/onboarding.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/images.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.x5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(
                AppStrings.getSetHired,
                textAlign: TextAlign.center,
                style: AppStyles.primary1Bold30,
              ),
              SizedBox(height: AppConstants.x3),
              Text(
                AppStrings.hiringMadeEasy,
                textAlign: TextAlign.center,
                style: AppStyles.primary3Bold20,
              ),
              const Spacer(flex: 2),
              CircleAvatar(
                backgroundImage: const AssetImage(AppImages.onboarding),
                radius: AppConstants.x7,
              ),
              const Spacer(flex: 2),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.register);
                },
                child: Text(
                  AppStrings.registerToContinue,
                  textAlign: TextAlign.center,
                  style: AppStyles.primary9Regular16,
                ),
              ),
              SizedBox(height: AppConstants.x4),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signIn);
                },
                child: Text(
                  AppStrings.alreadyHaveAccount,
                  textAlign: TextAlign.center,
                  style: AppStyles.primary1Regular16,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
