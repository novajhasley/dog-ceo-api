import 'package:dog_ceo_api/presentation/bloc/theme_bloc.dart';
import 'package:dog_ceo_api/presentation/bloc/theme_state.dart';
import 'package:dog_ceo_api/presentation/widgets/nav_bar_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ThemeBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (themeContext, theme) {
        return MaterialApp(
          theme: theme.themeData,
          home: const NavBarHolder(),
        );
      },
    );
  }
}
