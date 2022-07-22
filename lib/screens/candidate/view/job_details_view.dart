import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/screens/candidate/candidate.dart';
import 'package:hiring_app/screens/home/home.dart';
import 'package:hiring_app/services/db.dart';
import 'package:hiring_app/utils/colors.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';
import 'package:hiring_app/utils/time_utils.dart';
import 'package:hiring_app/widgets/buttons.dart';
import 'package:hiring_app/widgets/dialogs.dart';
import 'package:hiring_app/widgets/widgets.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({Key? key, required this.job}) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> job;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CandidateBloc, CandidateState>(
      listener: (context, state) {
        if (state is JobApplied) {
          context.read<HomeBloc>().add(const GetJobs());
          Dialogs.snackBar(context, state.message);
        } else if (state is CandidateError) {
          Dialogs.snackBar(context, state.message.toString());
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.x4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppConstants.x5),
                  Text(
                    job.get(AppConstants.jobTitle),
                    style: AppStyles.primary2Bold25,
                  ),
                  SizedBox(height: AppConstants.x3),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(job.get(AppConstants.avatar)),
                    ),
                    title: Text(
                      job.get(AppConstants.name),
                      style: AppStyles.primary3Bold18,
                    ),
                    subtitle: Text(
                      '${job.get(AppConstants.jobLocation)} (${job.get(AppConstants.jobCulture)})',
                      style: AppStyles.primary4Bold16,
                    ),
                  ),
                  SizedBox(height: AppConstants.x3),
                  Text(
                    TimeUtils.timeAgo(job.get(AppConstants.addedAt)),
                    style: AppStyles.greySemibold14,
                  ),
                  SizedBox(height: AppConstants.x4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.work_rounded,
                                color: AppColors.primary3,
                              ),
                              SizedBox(width: AppConstants.x3),
                              Text(
                                job.get(AppConstants.jobType),
                                style: AppStyles.primary3Bold14,
                              ),
                            ],
                          ),
                          SizedBox(height: AppConstants.x3),
                          Row(
                            children: [
                              const Icon(
                                Icons.security,
                                color: AppColors.primary3,
                              ),
                              SizedBox(width: AppConstants.x3),
                              Text(
                                job.get(AppConstants.sector),
                                style: AppStyles.primary3Bold14,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.money_rounded,
                                color: AppColors.primary3,
                              ),
                              SizedBox(width: AppConstants.x3),
                              Text(
                                job.get(AppConstants.jobPayRange),
                                style: AppStyles.primary3Bold14,
                              ),
                            ],
                          ),
                          SizedBox(height: AppConstants.x3),
                          Row(
                            children: [
                              const Icon(
                                Icons.store,
                                color: AppColors.primary3,
                              ),
                              SizedBox(width: AppConstants.x3),
                              Text(
                                job.get(AppConstants.employees),
                                style: AppStyles.primary3Bold14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppConstants.x4),
                  Text(
                    AppStrings.jobDescription,
                    style: AppStyles.blackSemiboldUnderline16,
                  ),
                  SizedBox(height: AppConstants.x3),
                  Text(
                    job.get(AppConstants.jobDescription),
                    style: AppStyles.greySemibold14,
                  ),
                  SizedBox(height: AppConstants.x4),
                  if (Db().isCandidate)
                    PrimaryButton(
                      onPressed: () {
                        if (!job.get(AppConstants.isApplied)) {
                          Dialogs.applyDialog(
                            context,
                            title: AppStrings.applyForJob,
                            onAction: () {
                              final key =
                                  context.read<CandidateBloc>().coverKey;
                              if (key.currentState?.validate() ?? false) {
                                context
                                    .read<CandidateBloc>()
                                    .add(AddApplication(job));
                                Navigator.pop(context);
                              }
                            },
                          );
                        }
                      },
                      child: BlocBuilder<CandidateBloc, CandidateState>(
                        builder: (context, state) {
                          return (state is CandidateLoading)
                              ? const Loader()
                              : Text(
                                  job.get(AppConstants.isApplied)
                                      ? AppStrings.applied
                                      : AppStrings.apply,
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
        floatingActionButton: const ExitButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      ),
    );
  }
}
