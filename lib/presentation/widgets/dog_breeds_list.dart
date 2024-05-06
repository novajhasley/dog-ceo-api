import 'package:dog_ceo_api/data/services/dog_api_service.dart';
import 'package:dog_ceo_api/presentation/widgets/dog_tile.dart';
import 'package:flutter/material.dart';

class DogBreedsList extends StatelessWidget {
  const DogBreedsList({
    super.key,
    required ValueNotifier<String> searchQuery,
    required this.apiService,
    required this.snapshot,
  }) : _searchQuery = searchQuery;

  final ValueNotifier<String> _searchQuery;
  final DogApiService apiService;
  final AsyncSnapshot<List<String>> snapshot;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: _searchQuery,
      builder: (context, value, child) {
        final results = snapshot.data!
            .where((dog) => dog.toLowerCase().contains(value.toLowerCase()))
            .toList();

        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            String breed = results[index].replaceFirst(
                results[index][0], results[index][0].toUpperCase());
            return FutureBuilder<String>(
              future: apiService.fetchImage(results[index]),
              builder: (context, imageSnapshot) {
                if (imageSnapshot.connectionState == ConnectionState.waiting) {
                  return DogTile(breed: breed, image: '');
                } else if (imageSnapshot.hasError) {
                  return DogTile(breed: breed, image: '');
                } else {
                  return DogTile(breed: breed, image: imageSnapshot.data!);
                }
              },
            );
          },
        );
      },
    );
  }
}
