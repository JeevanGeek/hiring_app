import 'package:flutter/material.dart';
import 'package:hiring_app/utils/strings.dart';

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
}
