import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/screens/candidate/candidate.dart';
import 'package:hiring_app/utils/strings.dart';
import 'package:hiring_app/utils/styles.dart';
import 'package:hiring_app/utils/validator.dart';

class Dialogs {
  static bool isShowing = false;

  static void snackBar(BuildContext context, String message) {
    if (isShowing) return;
    isShowing = true;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    Future.delayed(const Duration(milliseconds: 4000), () {
      isShowing = false;
    });
  }

  static void alertDialog(
    BuildContext context, {
    required String title,
    String? subtitle,
    required VoidCallback onYes,
    required VoidCallback onNo,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: subtitle == null ? null : Text(subtitle),
        actions: [
          TextButton(
            onPressed: onNo,
            child: const Text(AppStrings.no),
          ),
          TextButton(
            onPressed: onYes,
            child: const Text(AppStrings.yes),
          ),
        ],
      ),
    );
  }

  static void applyDialog(
    BuildContext context, {
    required String title,
    required VoidCallback onAction,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: context.select<CandidateBloc, GlobalKey<FormState>>(
              (value) => value.coverKey,
            ),
            child: TextFormField(
              controller: context.select<CandidateBloc, TextEditingController>(
                (value) => value.coverLetter,
              ),
              validator: (value) => Validator.validate(value),
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: 9,
              decoration: const InputDecoration(
                labelText: AppStrings.coverLetter,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: onAction,
            child: Text(
              AppStrings.submit,
              style: AppStyles.primary2Bold14,
            ),
          ),
        ],
      ),
    );
  }
}
