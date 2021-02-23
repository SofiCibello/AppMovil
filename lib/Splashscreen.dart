import 'package:flutter/material.dart';
import 'package:pantalla_principal/login.dart';
import 'package:pantalla_principal/main.dart';

/*
  Este archivo 'Splashscreen.dart' corresponde a la primera pantalla
  que se muestra cuando la aplicación es ejecutada.
  En este archivo se definen todas las propiedades de dicha pantalla, tales como
  el título, la imágen referente al logo de esta aplicación, el/los íconos que aparecerán, entre otras.
*/

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(
          milliseconds: 2000),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Spacer(),
            Center(
              child: FractionallySizedBox(
                widthFactor: .9,
                child: Image.asset(
                  'assets/logoArduino.jpeg',  // imágen referente al logo de dicha aplicación
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Spacer(),
            CircularProgressIndicator(),  // ícono de carga que aparece en esta pantalla
            Spacer(),
            Text(
              'Bienvenido/Welcome',
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
