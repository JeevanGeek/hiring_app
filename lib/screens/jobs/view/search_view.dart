import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/screens/home/home.dart';
import 'package:hiring_app/screens/jobs/jobs.dart';
import 'package:hiring_app/utils/colors.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/widgets/widgets.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.x4),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: AppConstants.x4),
            TextField(
              onChanged: (q) {
                BlocProvider.of<JobsBloc>(context).searchNews(q);
              },
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                filled: true,
                isCollapsed: true,
                fillColor: AppColors.lightGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                suffixIcon: const Icon(
                  Icons.search,
                ),
                hintText: AppStrings.searchForJobs,
                hintStyle: const TextStyle(height: 1),
              ),
            ),
            SizedBox(height: AppConstants.x4),
            BlocBuilder<JobsBloc, JobsState>(builder: (context, state) {
              if (state is SearchJobLoaded) {
                return HomeJobs(jobs: state.jobs);
              } else if (state is SearchJobEmpty) {
                return const JobsNotAvailable();
              } else if (state is SearchLoading) {
                return const ShimmerLoader();
              }
              return const Empty();
            }),
          ],
        ),
      ),
    );
  }
}
