import 'package:flutter/material.dart';
import 'landing_screen.dart'; // Importa la pantalla principal

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navegar automáticamente a la pantalla principal después de 3 segundos
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BreedImageListScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/gato.png',
          width: 200, // Ajusta el tamaño según sea necesario
          height: 200,
        ),
      ),
    );
  }
}
