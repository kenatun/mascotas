import 'package:flutter/material.dart';
import '../models/breed.dart';

class BreedDetailScreen extends StatelessWidget {
  final Breed breed;
  final String imageUrl;

  BreedDetailScreen({required this.breed, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
      ),
      body: Column(
        children: [
          // Imagen fija en la parte superior
          Image.network(
            imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      breed.name,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      breed.description,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'País de origen: ${breed.origin}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Inteligencia: ${breed.intelligence}/5',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Adaptabilidad: ${breed.adaptability}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Tiempo de vida: ${breed.lifeSpan} años',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Amigable con los gatos: ${breed.catFriendly} ',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Amigable con los perros: ${breed.dogFriendly} ',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Aseo: ${breed.grooming} ',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
