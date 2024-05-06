import 'package:flutter_test/flutter_test.dart';
import 'package:dog_ceo_api/presentation/pages/dog_breed_page.dart';
import 'package:flutter/material.dart';

void main() {
  group('DogBreedPage', () {
    ///////////////////////////////////////////////////
    //displays correct breed name and image
    testWidgets('displays correct breed name and image',
        (WidgetTester tester) async {
      // Arrange
      const breed = 'affenpinscher';
      const image = 'https://dog.ceo/api/breed/affenpinscher/images/random';

      // Act
      await tester.pumpWidget(
          const MaterialApp(home: DogBreedPage(breed: breed, image: image)));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(breed), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });
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
//DogBreedPage should respond to different screen sizes and orientations
  testWidgets(
      'DogBreedPage should respond to different screen sizes and orientations',
      (WidgetTester tester) async {
    // Arrange
    const breed = 'affenpinscher';
    const image = 'https://dog.ceo/api/breed/affenpinscher/images/random';

    // Act & Assert
    for (var screenType in ['small', 'medium', 'large', 'tablet']) {
      for (var orientation in [Orientation.portrait, Orientation.landscape]) {
        tester.binding.setSurfaceSize(getScreenSize(screenType, orientation));

        await tester.pumpWidget(
            const MaterialApp(home: DogBreedPage(breed: breed, image: image)));
        await tester.pumpAndSettle();

        // Check Hero
        expect(find.byType(Hero), findsOneWidget);

        // Check Image
        expect(find.byType(Image), findsOneWidget);
      }
    }
  });
}
