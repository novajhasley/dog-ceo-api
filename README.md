Dog CEO API Flutter Application
===============================

![Screenshot 2024-05-06 144716](https://github.com/novajhasley/dog-ceo-api/assets/160355054/1750169b-3ca6-4675-8785-3c6516fe87c0)
![Screenshot 2024-05-06 145859](https://github.com/novajhasley/dog-ceo-api/assets/160355054/c5bb6006-e375-45b7-a5bd-7d9e857f9f15)

This application is a simple Flutter app that uses the Dog CEO API to display a list of dog breeds and their images.

Setup Instructions
------------------

1.  Clone the repository to your local machine.
2.  Navigate to the project directory.
3.  Run `flutter pub get` to install the dependencies.
4.  Run `flutter run` to start the application.

Dependencies
------------

The following dependencies are used in this project:

-   `flutter`: The Flutter SDK is required to build and run Flutter applications.
-   `cupertino_icons`: This package is used for iOS style icons.
-   `http`: This package is used to perform network requests to the Dog CEO API.
-   `flutter_spinkit`: This package is used for displaying loading indicators.
-   `flutter_bloc`: This package is used for state management in the application.
-   `mocktail`: This package is used for mocking in tests.
-   `bloc_test`: This package is used for testing the blocs.
-   `integration_test`: This package is used for running integration tests.
-   `flutter_test`: This package is used for running unit and widget tests.
-   `flutter_lints`: This package is used for enforcing recommended lint rules.

Architecture
------------

The application follows a simple architecture with the following components:

-   `HomePage`: This is a widget that serves as the main screen of the application. It displays a list or grid of dog breeds fetched from the Dog CEO API. In the top right corner, it has search functionality. 

-   `DogBreedPage`: This is a widget that displays a larger image of the dog breed. It uses the `Hero` widget to create a smooth transition between the `DogTile` and itself.

-   `SettingsPage`: This is a widget that has a toggle for the light and dark theme controlled by Bloc.
