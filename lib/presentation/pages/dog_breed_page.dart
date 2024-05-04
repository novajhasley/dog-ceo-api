import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DogBreedPage extends StatefulWidget {
  final String breed;

  const DogBreedPage({super.key, required this.breed});

  @override
  DogBreedPageState createState() => DogBreedPageState();
}

class DogBreedPageState extends State<DogBreedPage> {
  late Future<String> futureImage;

  Future<String> fetchImage() async {
    try {
      final response = await http.get(
          Uri.parse('https://dog.ceo/api/breed/${widget.breed}/images/random'));

      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      print('An error occurred: $e');
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    futureImage = fetchImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.breed),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: futureImage,
          builder: (context, snapshot) {
            //LOADING SCREEN
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
              );
            }
            //ERROR DIALOG
            else if (snapshot.hasError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Oops!'),
                      content: Text(
                          'Sorry for the inconvenience. Error: ${snapshot.error}'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              });
              return Container();
            }
            //DOG IMAGE
            else {
              return Image.network(snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}
