import 'package:flutter/material.dart';
import '../../constants/colors.dart';

void showMyDialog({
  required BuildContext context,
  required String title,
  required String message,
  required String buttonText,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: TAppColors.kBlack3,
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text(
              buttonText,
              style: const TextStyle(
                color: TAppColors.kBlue,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
