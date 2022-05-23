import 'package:coodoo_style_flutter_project/src/core/exceptions/app.exception.dart';
import 'package:coodoo_style_flutter_project/src/core/utils/text.util.dart';
import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({Key? key, this.error}) : super(key: key);

  final dynamic error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            error is AppException
                ? error.message
                : TextUtil.defaultErrorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
