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
        ));
}

class ThemeDarkState extends ThemeState {
  ThemeDarkState()
      : super(ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          cardColor: Colors.grey[900],
        ));
}
