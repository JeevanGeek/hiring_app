import 'package:flutter/material.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/images.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';
import 'package:hiring_app/widgets/buttons.dart';

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
              TweenAnimationBuilder(
                tween: Tween(
                  begin: AppConstants.x0,
                  end: AppConstants.x7,
                ),
                duration: const Duration(microseconds: 1),
                builder: (_, double value, __) => CircleAvatar(
                  backgroundImage: const AssetImage(AppImages.onboarding),
                  radius: value,
                ),
              ),
              const Spacer(flex: 2),
              PrimaryButton(
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
              SecondaryButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.login);
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
