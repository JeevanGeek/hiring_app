import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/data/static_data.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/auth/auth.dart' as auth;
import 'package:hiring_app/screens/recruiter/recruiter.dart';
import 'package:hiring_app/utils/colors.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';
import 'package:hiring_app/utils/validator.dart';
import 'package:hiring_app/widgets/buttons.dart';
import 'package:hiring_app/widgets/dialogs.dart';
import 'package:hiring_app/widgets/widgets.dart';

class RecruiterEditView extends StatelessWidget {
  const RecruiterEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RecruiterBloc, RecruiterState>(
        listener: (context, state) {
          if (state is auth.LoggedOut) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.onboarding,
              (route) => false,
            );
          } else if (state is ProfileSaved) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
              (route) => false,
            );
          } else if (state is ShowError) {
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
                  key: context.select<RecruiterBloc, GlobalKey<FormState>>(
                    (value) => value.recruiterKey,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.recruiterProfile,
                            style: AppStyles.primary2Bold25,
                          ),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<auth.AuthBloc>()
                                  .add(const auth.UserLogout());
                            },
                            icon: const Icon(Icons.power_settings_new),
                            color: AppColors.red,
                            iconSize: AppConstants.x5,
                          )
                        ],
                      ),
                      SizedBox(height: AppConstants.x4),
                      Text(
                        AppStrings.completeProfile,
                        style: AppStyles.blackRegular15,
                      ),
                      SizedBox(height: AppConstants.x5),
                      TextFormField(
                        controller: context
                            .select<RecruiterBloc, TextEditingController>(
                          (value) => value.companyController,
                        ),
                        validator: (value) => Validator.validate(value),
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          hintText: AppStrings.companyNameExample,
                          labelText: AppStrings.companyName,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      TextFormField(
                        controller: context
                            .select<RecruiterBloc, TextEditingController>(
                          (value) => value.phoneController,
                        ),
                        validator: (value) => Validator.validate(value),
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: AppStrings.phoneExample,
                          labelText: AppStrings.phone,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      DropdownButtonFormField<String>(
                        validator: (value) => Validator.validate(value),
                        items: StaticData.sector
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            context.read<RecruiterBloc>().sector = value;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: AppStrings.sector,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      DropdownButtonFormField<String>(
                        validator: (value) => Validator.validate(value),
                        items: StaticData.employees
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            context.read<RecruiterBloc>().employees = value;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: AppStrings.employees,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      DropdownButtonFormField<String>(
                        validator: (value) => Validator.validate(value),
                        items: StaticData.city
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            context.read<RecruiterBloc>().city = value;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: AppStrings.city,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      TextFormField(
                        controller: context
                            .select<RecruiterBloc, TextEditingController>(
                          (value) => value.websiteController,
                        ),
                        validator: (value) => Validator.validate(value),
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: AppStrings.websiteExample,
                          labelText: AppStrings.website,
                        ),
                      ),
                      SizedBox(height: AppConstants.x5),
                      PrimaryButton(
                        onPressed: () {
                          final key =
                              context.read<RecruiterBloc>().recruiterKey;
                          if (key.currentState?.validate() ?? false) {
                            context
                                .read<RecruiterBloc>()
                                .add(const SaveRecruiterProfile());
                          }
                        },
                        child: BlocBuilder<RecruiterBloc, RecruiterState>(
                          builder: (context, state) {
                            return (state is Loading)
                                ? const Loader()
                                : Text(
                                    AppStrings.submit,
                                    textAlign: TextAlign.center,
                                    style: AppStyles.primary9Regular16,
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
      ),
    );
  }
}
