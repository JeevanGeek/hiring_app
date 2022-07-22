import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/screens/home/home.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';
import 'package:hiring_app/widgets/widgets.dart';

class ApplicationView extends StatelessWidget {
  const ApplicationView({Key? key}) : super(key: key);

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
              AppStrings.jobApplications,
              style: AppStyles.blackSemibold16,
            ),
            SizedBox(height: AppConstants.x4),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state is JobLoaded) {
                final jobs = state.applications;
                if (jobs.isEmpty) {
                  return const JobsNotAvailable();
                }
                return ApplicationJobs(jobs: state.applications);
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
