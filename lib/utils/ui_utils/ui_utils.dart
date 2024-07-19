import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showErrorMessage({
  required String message,
  required BuildContext context,
  required VoidCallback onTap,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title:  Text(
        "message".tr(),
        style: const TextStyle(fontWeight: FontWeight.w800),
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          message.tr(),
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: onTap,
          isDefaultAction: true,
          child:  Text("ok".tr()),
        )
      ],
    ),
  );
}