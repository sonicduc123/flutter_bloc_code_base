import 'package:flutter/material.dart';

import '../widgets.dart';

typedef DialogAction = Function();

showDialogBox({
  required BuildContext context,
  required String title,
  required String content,
  DialogAction? confirmAction,
  DialogAction? cancelAction,
  DialogType? type,
}) async {
  String? choice = await showDialog(
    context: context,
    builder: (BuildContext context) => DialogBox(
      title: title,
      content: content,
      type: type ?? DialogType.ok,
    ),
  );
  if (choice == "Confirm") {
    confirmAction != null ? confirmAction() : null;
  } else {
    cancelAction != null ? cancelAction() : null;
  }
}
