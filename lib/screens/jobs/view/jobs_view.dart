import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/routes/routes.dart';
import 'package:hiring_app/screens/home/home.dart';
import 'package:hiring_app/services/db.dart';
import 'package:hiring_app/utils/colors.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';
import 'package:hiring_app/widgets/widgets.dart';

class JobsView extends StatelessWidget {
  const JobsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.x4),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: AppConstants.x4),
            Text(
              AppStrings.welcomeBack,
              style: AppStyles.blackSemibold16,
            ),
            Text(
              Db().profile?.get(AppConstants.name),
              style: AppStyles.primary2Bold25,
            ),
            SizedBox(height: AppConstants.x4),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state is JobLoaded) {
                return JobsAvailable(jobs: state.jobs);
              } else if (state is JobEmpty) {
                return const JobsNotAvailable();
              } else {
                return const ShimmerLoader();
              }
            }),
          ],
        ),
      ),
    );
  }
}

class JobsNotAvailable extends StatelessWidget {
  const JobsNotAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppConstants.x5),
        const NoJobsFound(),
        SizedBox(height: AppConstants.x5),
        if (Db().isRecruiter) ...[
          Text(
            AppStrings.addNewJobs,
            textAlign: TextAlign.center,
            style: AppStyles.blackMedium16,
          ),
          SizedBox(height: AppConstants.x5),
        ],
      ],
    );
  }
}

class JobsAvailable extends StatelessWidget {
  const JobsAvailable({
    Key? key,
    required this.jobs,
  }) : super(key: key);

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> jobs;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: jobs.length,
      separatorBuilder: ((context, index) => const Divider()),
      itemBuilder: ((context, index) {
        final job = jobs[index];
        return ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.job,
              arguments: job,
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.x4),
          ),
          isThreeLine: true,
          tileColor: AppColors.primary9,
          leading: CircleAvatar(
            radius: AppConstants.x5,
            backgroundImage: NetworkImage(job.get(AppConstants.avatar)),
          ),
          title: Text(
            job.get(AppConstants.jobTitle),
            style: AppStyles.primary2Bold18,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                job.get(AppConstants.name),
                style: AppStyles.primary3Bold16,
              ),
              Text(
                '${job.get(AppConstants.jobLocation)} (${job.get(AppConstants.jobCulture)})',
                style: AppStyles.primary4Bold14,
              ),
            ],
          ),
        );
      }),
    );
  }
}
