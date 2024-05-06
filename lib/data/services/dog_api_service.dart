import 'package:http/http.dart' as http;
import 'dart:convert';

class DogApiService {
  //API call to fetch dog breeds
  Future<List<String>> fetchDogBreeds() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var breeds = data['message'].keys.toList().cast<String>();
      return breeds;
    } else {
      throw Exception('Failed to load dog breeds');
    }
  }

  //API call to fetch dog breed image
  Future<String> fetchImage(String breed) async {
    final imageResponse = await http
        .get(Uri.parse('https://dog.ceo/api/breed/$breed/images/random'));
    if (imageResponse.statusCode == 200) {
      return json.decode(imageResponse.body)['message'];
    } else {
      throw Exception('Failed to load image for breed $breed');
    }
  }
}
