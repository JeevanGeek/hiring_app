import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hiring_app/utils/colors.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';
import 'package:hiring_app/utils/time_utils.dart';
import 'package:hiring_app/widgets/widgets.dart';

class ApplicantDetailsView extends StatelessWidget {
  const ApplicantDetailsView({Key? key, required this.applicant})
      : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> applicant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppConstants.x4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppConstants.x5),
                Center(
                  child: CircleAvatar(
                    radius: AppConstants.x6,
                    backgroundImage: NetworkImage(
                      applicant.get(AppConstants.avatar),
                    ),
                  ),
                ),
                SizedBox(height: AppConstants.x4),
                Center(
                  child: Text(
                    applicant.get(AppConstants.name),
                    style: AppStyles.primary3Bold18,
                  ),
                ),
                SizedBox(height: AppConstants.x3),
                Text(
                  applicant.get(AppConstants.city),
                  style: AppStyles.primary4Bold16,
                ),
                SizedBox(height: AppConstants.x3),
                Text(
                  TimeUtils.timeAgo(applicant.get(AppConstants.appliedAt)),
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
                              Icons.email_rounded,
                              color: AppColors.primary3,
                            ),
                            SizedBox(width: AppConstants.x3),
                            Text(
                              applicant.get(AppConstants.email),
                              style: AppStyles.primary3Bold14,
                            ),
                          ],
                        ),
                        SizedBox(height: AppConstants.x3),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone_enabled_rounded,
                              color: AppColors.primary3,
                            ),
                            SizedBox(width: AppConstants.x3),
                            Text(
                              applicant.get(AppConstants.phone),
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
                              Icons.person_rounded,
                              color: AppColors.primary3,
                            ),
                            SizedBox(width: AppConstants.x3),
                            Text(
                              applicant.get(AppConstants.gender),
                              style: AppStyles.primary3Bold14,
                            ),
                          ],
                        ),
                        SizedBox(height: AppConstants.x3),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_rounded,
                              color: AppColors.primary3,
                            ),
                            SizedBox(width: AppConstants.x3),
                            Text(
                              applicant.get(AppConstants.dob),
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
                  AppStrings.coverLetter,
                  style: AppStyles.blackSemiboldUnderline16,
                ),
                SizedBox(height: AppConstants.x3),
                Text(
                  applicant.get(AppConstants.coverLetter),
                  style: AppStyles.greySemibold14,
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
