import 'package:flutter/material.dart';
import 'package:hiring_app/utils/colors.dart';
import 'package:hiring_app/utils/constants.dart';
import 'package:hiring_app/utils/images.dart';
import 'package:hiring_app/utils/styles.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class Leading extends StatelessWidget {
  const Leading(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.primary2Regular16,
    );
  }
}

class Trailing extends StatelessWidget {
  const Trailing(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.primary2Bold16,
    );
  }
}

class ExitButton extends StatelessWidget {
  const ExitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pop(context),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      shape: const CircleBorder(),
      elevation: 0.1,
      mini: true,
      child: const Icon(Icons.close),
    );
  }
}

class NoJobsFound extends StatelessWidget {
  const NoJobsFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppImages.noJobs,
      height: MediaQuery.of(context).size.height / 2,
    );
  }
}

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(bottom: AppConstants.x3),
          height: AppConstants.x6,
          color: AppColors.white,
        ),
      ),
    );
  }
}
