import 'package:dog_ceo_api/presentation/widgets/dog_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:dog_ceo_api/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('navigate to DogBreedsPage', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      app.main();
      await tester.pumpAndSettle();

      // Tap on the DogTile.
      await tester.tap(find.byType(DogTile));
      await tester.pumpAndSettle();

      // Verify that the DogBreedsPage is displayed.
      // Check for the AppBar and the Hero widget with the specific tag.
      expect(find.byType(AppBar), findsOneWidget);
      expect(
          find.byWidgetPredicate((widget) =>
              widget is Hero && (widget.tag as String).startsWith('hero-')),
          findsOneWidget);
    });
  });
}
