import 'package:flutter/material.dart';

class AdviceField extends StatelessWidget {
  const AdviceField({
    super.key,
    required this.advice,
  });

  final String advice;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          color: themeData.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          '''" $advice "''',
          textAlign: TextAlign.center,
          style: themeData.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
