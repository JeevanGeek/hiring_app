import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/data/static_data.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/candidate/candidate.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';
import 'package:hiring_app/utils/validator.dart';
import 'package:hiring_app/widgets/buttons.dart';
import 'package:hiring_app/widgets/dialogs.dart';
import 'package:hiring_app/widgets/widgets.dart';

class CandidateEditPage extends StatelessWidget {
  const CandidateEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CandidateBloc(),
      child: const CandidateEditView(),
    );
  }
}

class CandidateEditView extends StatelessWidget {
  const CandidateEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CandidateBloc, CandidateState>(
        listener: (context, state) {
          if (state is ProfileSaved) {
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
                  key: context.select<CandidateBloc, GlobalKey<FormState>>(
                    (value) => value.profileKey,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppStrings.candidateProfile,
                        style: AppStyles.primary2Bold25,
                      ),
                      SizedBox(height: AppConstants.x4),
                      Text(
                        AppStrings.completeProfile,
                        style: AppStyles.blackRegular15,
                      ),
                      SizedBox(height: AppConstants.x5),
                      TextFormField(
                        controller: context
                            .select<CandidateBloc, TextEditingController>(
                          (value) => value.nameController,
                        ),
                        validator: (value) => Validator.validate(value),
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          hintText: AppStrings.nameExample,
                          labelText: AppStrings.name,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      TextFormField(
                        controller: context
                            .select<CandidateBloc, TextEditingController>(
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
                        items: StaticData.iAm
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            context.read<CandidateBloc>().iAm = value;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: AppStrings.iAm,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      DropdownButtonFormField<String>(
                        validator: (value) => Validator.validate(value),
                        items: StaticData.gender
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            context.read<CandidateBloc>().gender = value;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: AppStrings.gender,
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
                            context.read<CandidateBloc>().city = value;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: AppStrings.city,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      TextFormField(
                        controller: context
                            .select<CandidateBloc, TextEditingController>(
                          (value) => value.dobController,
                        ),
                        validator: (value) => Validator.validate(value),
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: AppStrings.dobExample,
                          labelText: AppStrings.dob,
                        ),
                      ),
                      SizedBox(height: AppConstants.x5),
                      PrimaryButton(
                        onPressed: () {
                          final key = context.read<CandidateBloc>().profileKey;
                          if (key.currentState?.validate() ?? false) {
                            context
                                .read<CandidateBloc>()
                                .add(const SaveCandidateProfile());
                          }
                        },
                        child: BlocBuilder<CandidateBloc, CandidateState>(
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
