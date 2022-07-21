import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/data/static_data.dart';
import 'package:hiring_app/screens/home/home.dart' as home;
import 'package:hiring_app/screens/recruiter/recruiter.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';
import 'package:hiring_app/utils/validator.dart';
import 'package:hiring_app/widgets/buttons.dart';
import 'package:hiring_app/widgets/dialogs.dart';
import 'package:hiring_app/widgets/widgets.dart';

class NewJobView extends StatelessWidget {
  const NewJobView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RecruiterBloc, RecruiterState>(
        listener: (context, state) {
          if (state is JobAdded) {
            context.read<home.HomeBloc>().add(const home.GetJobs());
            Dialogs.snackBar(context, state.message);
            Navigator.pop(context);
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
                    (value) => value.jobKey,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppStrings.addNewJob,
                        style: AppStyles.primary2Bold25,
                      ),
                      SizedBox(height: AppConstants.x4),
                      TextFormField(
                        controller: context
                            .select<RecruiterBloc, TextEditingController>(
                          (value) => value.jobTitleController,
                        ),
                        validator: (value) => Validator.validate(value),
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: AppStrings.jobTitleExample,
                          labelText: AppStrings.jobTitle,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      DropdownButtonFormField<String>(
                        validator: (value) => Validator.validate(value),
                        items: StaticData.jobType
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            context.read<RecruiterBloc>().jobType = value;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: AppStrings.jobType,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      DropdownButtonFormField<String>(
                        validator: (value) => Validator.validate(value),
                        items: StaticData.jobCulture
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            context.read<RecruiterBloc>().jobCulture = value;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: AppStrings.jobCulture,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      DropdownButtonFormField<String>(
                        validator: (value) => Validator.validate(value),
                        items: StaticData.payRange
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            context.read<RecruiterBloc>().payRange = value;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: AppStrings.payRange,
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
                            context.read<RecruiterBloc>().location = value;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: AppStrings.location,
                        ),
                      ),
                      SizedBox(height: AppConstants.x4),
                      TextFormField(
                        controller: context
                            .select<RecruiterBloc, TextEditingController>(
                          (value) => value.jobDescriptionController,
                        ),
                        validator: (value) => Validator.validate(value),
                        keyboardType: TextInputType.multiline,
                        minLines: 2,
                        maxLines: 10,
                        decoration: const InputDecoration(
                          hintText: AppStrings.jobDescriptionExample,
                          labelText: AppStrings.jobDescription,
                        ),
                      ),
                      SizedBox(height: AppConstants.x5),
                      PrimaryButton(
                        onPressed: () {
                          final key = context.read<RecruiterBloc>().jobKey;
                          if (key.currentState?.validate() ?? false) {
                            context.read<RecruiterBloc>().add(const AddJob());
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
      floatingActionButton: const ExitButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
