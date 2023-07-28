import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.error,
          size: 40,
          color: Colors.red,
        ),
        const SizedBox(height: 20),
        Text(
          message,
          textAlign: TextAlign.center,
          style: themeData.textTheme.headlineMedium,
        ),
      ],
    );
  }
}
