import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

loadingAlertDialog(BuildContext context, {bool isDismissible = false}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Loading".tr()),
            ),
          ],
        ),
      );
    },
  );
}
