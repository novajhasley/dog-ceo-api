import 'package:flutter/material.dart';

class DogBreedPage extends StatefulWidget {
  final String breed;
  final String image;

  const DogBreedPage({super.key, required this.breed, required this.image});

  @override
  DogBreedPageState createState() => DogBreedPageState();
}

class DogBreedPageState extends State<DogBreedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.breed),
        ),
        body: Image.network(widget.image));
  }
}
