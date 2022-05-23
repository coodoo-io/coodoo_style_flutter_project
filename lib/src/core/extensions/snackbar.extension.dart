import 'package:flutter/material.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar({required Text message, Color? backgroundColor}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: message,
      backgroundColor: backgroundColor,
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(
        message: Text(message,
            style: const TextStyle(
                color: Color(0xffffffff), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.red);
  }
}
