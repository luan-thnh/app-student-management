import 'package:flutter/material.dart';
import 'package:student_management/constants/colors_theme.dart';
import 'package:student_management/services/api/student_api.dart';

class DialogUtils {
  static Future<void> showMyDialog(context, Function onConfirm) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          backgroundColor: ColorsTheme.white,
          elevation: 0,
          shadowColor: ColorsTheme.white,
          actionsAlignment: MainAxisAlignment.center,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Are you sure to delete this student?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorsTheme.blue, fontSize: 16),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(backgroundColor: ColorsTheme.blue),
              onPressed: () {
                onConfirm();
              },
              child: Text(
                'Delete',
                style: TextStyle(color: ColorsTheme.white, fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                  side: BorderSide(width: 2, color: ColorsTheme.blue),
                ),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(color: ColorsTheme.blue, fontWeight: FontWeight.w600),
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
}
