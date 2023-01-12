import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';

enum SnackbarStatus { success, failed, other }

class AppSnackbar {
  static SnackBar show(ThemeData theme, String text, {SnackbarStatus status = SnackbarStatus.other}) {
    Color? backgroundColor;
    Color? textColor;
    switch (status) {
      case SnackbarStatus.failed:
        backgroundColor = theme.errorColor;
        textColor = kColtextColor;
        break;
      case SnackbarStatus.success:
        backgroundColor = kColsuccessColor;
        textColor = kColtextColor;
        break;
      case SnackbarStatus.other:
        backgroundColor = kColprimaryColorLight;
        textColor = kColtextColor;
        break;
    }
    return SnackBar(
      backgroundColor: backgroundColor,
      dismissDirection: DismissDirection.vertical,
      content: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: textColor,
        ),
      ),
      margin: kADmarginAll,
      duration: const Duration(seconds: 2),
    );
  }
}
