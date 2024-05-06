import 'package:dog_ceo_api/presentation/bloc/theme_bloc.dart';
import 'package:dog_ceo_api/presentation/bloc/theme_event.dart';
import 'package:dog_ceo_api/presentation/bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Theme:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Light'),
                Switch(
                  value: (context.watch<ThemeBloc>().state is ThemeDarkState),
                  onChanged: (value) {
                    context
                        .read<ThemeBloc>()
                        .add(value ? ThemeDarkEvent() : ThemeLightEvent());
                  },
                ),
                const Text('Dark'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
