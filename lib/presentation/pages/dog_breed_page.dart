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
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(widget.breed,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Hero(
          tag: 'hero-$widget.breed',
          child: Image.network(widget.image),
        ));
  }
}
