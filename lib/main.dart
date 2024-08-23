import 'package:flutter/material.dart';
import 'package:mascotas/view/landing_screen.dart';
import 'package:mascotas/viewmodel/breed_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BreedImageViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Breeds App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BreedImageListScreen(),
    );
  }
}
