import 'package:flutter/material.dart';

class DogBreedPage extends StatelessWidget {
  final String breed;

  const DogBreedPage({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed),
      ),
      body: Center(
        child: Text('This is the page for $breed.'),
      ),
    );
  }
}
