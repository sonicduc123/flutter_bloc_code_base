import 'package:flutter/material.dart';

import 'toast_color.dart';

enum ToastType { information, success, fail }

showToast(
    {required BuildContext context, required String message, ToastType? type}) {
  Color color = ToastColor.informationColor;
  if (type == ToastType.information) {
    color = ToastColor.informationColor;
  } else if (type == ToastType.success) {
    color = ToastColor.successColor;
  } else if (type == ToastType.fail) {
    color = ToastColor.failColor;
  }
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
