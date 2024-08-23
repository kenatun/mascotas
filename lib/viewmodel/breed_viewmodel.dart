import 'package:flutter/material.dart';
import '../models/breed_image.dart';
import '../services/api_service.dart';

class BreedImageViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<BreedImage> breedImages = [];

  Future<void> fetchBreedImages() async {
    try {
      breedImages = await _apiService.fetchBreedImages();
      notifyListeners();
    } catch (e) {
      print("Failed to fetch breed images: $e");
    }
  }
}
