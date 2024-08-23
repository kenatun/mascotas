import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/breed_viewmodel.dart';
import 'breed_detail_screen.dart'; // Importa la pantalla de detalles

class BreedImageListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<BreedImageViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bengal Cat Breeds'),
      ),
      body: FutureBuilder(
        future: viewModel.fetchBreedImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load breed images'));
          } else {
            return ListView.builder(
              itemCount: viewModel.breedImages.length,
              itemBuilder: (context, index) {
                final breedImage = viewModel.breedImages[index];
                final breed = breedImage.breed;

                return Card(
                  elevation: 4.0,
                  margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              breed?.name ?? 'Nombre Raza',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navegar a la pantalla de detalles con la raza y la URL de la imagen
                                if (breed != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BreedDetailScreen(
                                        breed: breed,
                                        imageUrl: breedImage.url,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Text('Más...'),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          breedImage.url,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'País de origen: ${breed?.origin ?? 'País de origen'}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              'Inteligencia: ${breed?.intelligence ?? 'Inteligencia'}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
