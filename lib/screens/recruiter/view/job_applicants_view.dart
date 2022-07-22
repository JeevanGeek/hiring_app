import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/recruiter/recruiter.dart';
import 'package:hiring_app/utils/colors.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';
import 'package:hiring_app/widgets/widgets.dart';

class JobApplicantsPage extends StatelessWidget {
  const JobApplicantsPage({Key? key, required this.job}) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> job;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<RecruiterBloc>(context)
        ..add(GetApplicants(job.get(AppConstants.id))),
      child: const JobApplicantsView(),
    );
  }
}

class JobApplicantsView extends StatelessWidget {
  const JobApplicantsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.x4),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: AppConstants.x4),
                Text(
                  AppStrings.jobApplicants,
                  style: AppStyles.blackSemibold16,
                ),
                SizedBox(height: AppConstants.x4),
                BlocBuilder<RecruiterBloc, RecruiterState>(
                  builder: (context, state) {
                    if (state is ApplicantsLoaded) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.applicants.length,
                        separatorBuilder: ((context, index) => const Divider()),
                        itemBuilder: ((context, index) {
                          final applicant = state.applicants[index];
                          return ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.applicantDetails,
                                arguments: applicant,
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppConstants.x4),
                            ),
                            isThreeLine: true,
                            tileColor: AppColors.primary9,
                            leading: CircleAvatar(
                              radius: AppConstants.x5,
                              backgroundImage: NetworkImage(
                                  applicant.get(AppConstants.avatar)),
                            ),
                            title: Text(
                              applicant.get(AppConstants.name),
                              style: AppStyles.primary2Bold18,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  applicant.get(AppConstants.iAm),
                                  style: AppStyles.primary3Bold16,
                                ),
                                Text(
                                  applicant.get(AppConstants.city),
                                  style: AppStyles.primary4Bold14,
                                ),
                              ],
                            ),
                          );
                        }),
                      );
                    }
                    return const Loader();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const ExitButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
