import 'package:bloc_test/bloc_test.dart';
import 'package:dog_ceo_api/presentation/bloc/theme_bloc.dart';
import 'package:dog_ceo_api/presentation/bloc/theme_event.dart';
import 'package:dog_ceo_api/presentation/bloc/theme_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ThemeBloc', () {
    blocTest<ThemeBloc, ThemeState>(
      'emits [ThemeDarkState] when ThemeDarkEvent is added',
      build: () => ThemeBloc(),
      act: (bloc) => bloc.add(ThemeDarkEvent()),
      expect: () => [ThemeDarkState()],
    );

    blocTest<ThemeBloc, ThemeState>(
      'emits [ThemeLightState] when ThemeLightEvent is added',
      build: () => ThemeBloc(),
      act: (bloc) => bloc.add(ThemeLightEvent()),
      expect: () => [ThemeLightState()],
    );
  });
}
