import 'breed.dart';

class BreedImage {
  final String id;
  final String url;
  final int width;
  final int height;
  final Breed? breed;

  BreedImage({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    this.breed,
  });

  factory BreedImage.fromJson(Map<String, dynamic> json) {
    return BreedImage(
      id: json['id'],
      url: json['url'],
      width: json['width'],
      height: json['height'],
      breed: json['breeds'] != null && json['breeds'].isNotEmpty
          ? Breed.fromJson(json['breeds'][0])
          : null,
    );
  }
}
