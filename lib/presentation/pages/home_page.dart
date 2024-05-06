import 'package:dog_ceo_api/data/services/dog_api_service.dart';
import 'package:dog_ceo_api/presentation/widgets/dog_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final DogApiService apiService = DogApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dog Breeds',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: apiService.fetchDogBreeds(),
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
          //DOG BREEDS LIST
          else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                String breed = snapshot.data![index].replaceFirst(
                    snapshot.data![index][0],
                    snapshot.data![index][0].toUpperCase());
                return FutureBuilder<String>(
                  future: apiService.fetchImage(snapshot.data![index]),
                  builder: (context, imageSnapshot) {
                    if (imageSnapshot.connectionState ==
                        ConnectionState.waiting) {
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
          }
        },
      ),
    );
  }
}
