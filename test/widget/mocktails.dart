import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dog_ceo_api/data/services/dog_api_service.dart';

//////////////////////////////////////
//HOMEPAGE TESTS

//fetches and displays all dog breeds
class MockDogApiService extends Mock implements DogApiService {}

//navigates to DogBreedPage when a breed is clicked
class MockNavigatorObserver extends Mock implements NavigatorObserver {}
