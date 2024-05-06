import 'package:flutter/material.dart';

class ThemeState {
  final ThemeData themeData;

  ThemeState(this.themeData);
}

class ThemeLightState extends ThemeState {
  ThemeLightState()
      : super(ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 243, 240, 240),
          cardColor: Colors.white,
          colorScheme: ThemeData.light().colorScheme.copyWith(
                primary: Colors.blue,
                secondary: Colors.green,
              ),
        ));
}

class ThemeDarkState extends ThemeState {
  ThemeDarkState()
      : super(ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          cardColor: Colors.grey[900],
          colorScheme: ThemeData.dark().colorScheme.copyWith(
                primary: const Color.fromARGB(255, 206, 162, 241),
                secondary: Colors.purple,
              ),
        ));
}
