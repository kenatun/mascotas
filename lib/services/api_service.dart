import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/breed_image.dart';

class ApiService {
  static const _apiKey =
      'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr';
  static const _baseUrl = 'https://api.thecatapi.com/v1';

  Future<List<BreedImage>> fetchBreedImages() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/images/search?limit=11&breed_ids=beng'),
      headers: {
        'x-api-key': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map<BreedImage>((data) => BreedImage.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load breed images');
    }
  }
}
