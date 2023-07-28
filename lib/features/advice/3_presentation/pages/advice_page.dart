import 'package:advice/core/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(
              context,
            ).isDarkModeOn,
            onChanged: (value) =>
                Provider.of<ThemeService>(context, listen: false).toggleTheme(),
          )
        ],
        title: Text(
          'Advicer',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const Body(),
    );
  }
}
