import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/features/confirm_dialog/presentation/dialog_box.dart';
import 'package:flutter_starter/i18n/strings.g.dart';

Future<bool> showConfirmDialog(
  BuildContext context, {
  String? title,
  String? content,
  Function()? confirmAction,
  String? confirmText,
  Function()? cancelAction,
  String? cancelText,
  bool? popOnClick,
  bool hideCancel = false,
  bool shake = false,
  bool dangerConfirm = false,
  bool barrierDismissible = true,
  int? confirmCooldown,
  Widget? contentWidget,
}) async {
  bool confirmed = false;
  await showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) => DialogBox(
      title: title ?? t.common.are_you_sure,
      content: content,
      shake: shake,
      dangerConfirm: dangerConfirm,
      confirmCooldown: confirmCooldown,
      contentWidget: contentWidget,
      confirmAction: () async {
        confirmed = true;

        HapticFeedback.lightImpact();

        if (popOnClick == true) {
          Navigator.of(context).pop();
        }

        await confirmAction?.call();

        if (popOnClick == null || popOnClick == false) {
          Navigator.of(context).pop();
        }
      },
      confirmText: confirmText ?? t.common.ok,
      cancelText: !hideCancel ? (cancelText ?? t.common.cancel) : null,
      cancelAction: () async {
        confirmed = false;

        HapticFeedback.lightImpact();
        await cancelAction?.call();
        Navigator.of(context).pop();
      },
    ),
  );

  return confirmed;
}
