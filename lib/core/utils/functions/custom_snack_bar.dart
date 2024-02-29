import 'package:flutter/material.dart';

import '../../constants/colors.dart';

void showSnackBar({
  required String message,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
      ),
      margin: const EdgeInsets.only(
        bottom: 12.0,
        right: 24.0,
        left: 24.0,
      ),
      backgroundColor: TAppColors.kGrey2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
    ),
  );
}
