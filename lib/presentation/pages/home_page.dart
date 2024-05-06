import 'package:dog_ceo_api/data/services/dog_api_service.dart';
import 'package:dog_ceo_api/presentation/widgets/dog_breeds_list.dart';
import 'package:dog_ceo_api/presentation/widgets/error_dialog.dart';
import 'package:dog_ceo_api/presentation/widgets/loading_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final DogApiService apiService = DogApiService();
  final ValueNotifier<String> _searchQuery = ValueNotifier('');
  final ValueNotifier<bool> _isSearching = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<bool>(
          valueListenable: _isSearching,
          builder: (context, isSearching, child) {
            return isSearching
                ? TextField(
                    onChanged: (value) => _searchQuery.value = value,
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                    ),
                  )
                : const Text('Dog Breeds');
          },
        ),
        actions: <Widget>[
          ValueListenableBuilder<bool>(
            valueListenable: _isSearching,
            builder: (context, isSearching, child) {
              return IconButton(
                icon: Icon(isSearching ? Icons.close : Icons.search),
                onPressed: () => _isSearching.value = !isSearching,
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: apiService.fetchDogBreeds(),
        builder: (context, snapshot) {
          //LOADING SCREEN
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }
          //ERROR DIALOG
          else if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (context) {
                  return ErrorDialog(errorMessage: snapshot.error.toString());
                },
              );
            });
            return Container();
          }
          //DOG BREEDS LIST
          else {
            return DogBreedsList(
                searchQuery: _searchQuery, apiService: apiService, snapshot: snapshot);
          }
        },
      ),
    );
  }
}
