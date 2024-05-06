import 'package:dog_ceo_api/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocktails.dart';

void main() {
  group('HomePage', () {
    ///////////////////////////////////////////////////
    //fetches and displays all dog breeds
    testWidgets('fetches and displays all dog breeds',
        (WidgetTester tester) async {
      // Arrange
      final apiService = MockDogApiService();
      when(() => apiService.fetchDogBreeds())
          .thenAnswer((_) async => ['breed1', 'breed2', 'breed3']);

      // Act
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      await tester.pumpAndSettle();

      // Assert
      verify(() => apiService.fetchDogBreeds()).called(1);
      expect(find.text('breed1'), findsOneWidget);
      expect(find.text('breed2'), findsOneWidget);
      expect(find.text('breed3'), findsOneWidget);
    });
  });

  ///////////////////////////////////////////////////
  //navigates to DogBreedPage when a breed is clicked
  testWidgets('navigates to DogBreedPage when a breed is clicked',
      (WidgetTester tester) async {
    // Arrange
    final apiService = MockDogApiService();
    when(() => apiService.fetchDogBreeds())
        .thenAnswer((_) async => ['breed1', 'breed2', 'breed3']);

    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: const HomePage(),
        navigatorObservers: [mockObserver],
      ),
    );
    await tester.pumpAndSettle(); // Wait for async operations to finish

    // Act
    await tester.tap(find.text('breed1'));
    await tester.pumpAndSettle();

    // Assert
    verify(() => mockObserver.didPush(any as Route, any as Route?)).called(1);
  });

  Size getScreenSize(String screenType, Orientation orientation) {
    switch (screenType) {
      case 'small':
        return orientation == Orientation.portrait
            ? const Size(320, 480)
            : const Size(480, 320);
      case 'medium':
        return orientation == Orientation.portrait
            ? const Size(375, 667)
            : const Size(667, 375);
      case 'large':
        return orientation == Orientation.portrait
            ? const Size(414, 896)
            : const Size(896, 414);
      case 'tablet':
        return orientation == Orientation.portrait
            ? const Size(768, 1024)
            : const Size(1024, 768);
      default:
        return const Size(414, 896);
    }
  }

  ///////////////////////////////////////////////////
  //HomePage should respond to different screen sizes and orientations
  testWidgets(
      'HomePage should respond to different screen sizes and orientations',
      (WidgetTester tester) async {
    // Arrange
    final apiService = MockDogApiService();
    when(() => apiService.fetchDogBreeds())
        .thenAnswer((_) async => ['breed1', 'breed2', 'breed3']);

    // Act & Assert
    for (var screenType in ['small', 'medium', 'large', 'tablet']) {
      for (var orientation in [Orientation.portrait, Orientation.landscape]) {
        tester.binding.setSurfaceSize(getScreenSize(screenType, orientation));

        await tester.pumpWidget(MaterialApp(home: HomePage()));
        await tester.pumpAndSettle();

        // Check ListView
        expect(find.byType(ListView), findsOneWidget);

        // Check Text widget 
        expect(find.text('Sorry for the inconvenience. Error:'), findsNothing);

        // Check TextButton 
        expect(find.widgetWithText(TextButton, 'OK'), findsNothing);
      }
    }
  });
}
