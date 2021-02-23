import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantalla_principal/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart' as globals;

/*
  Este archivo 'login.dart' es un widget de inicio de sesión, en el cual
  se definen varias propiedades de dicha pantalla tales como:
  la imágen referente al logo de esta aplicación,
  los cuadros de texto para completar con el nombre de usuario y contraseña,
  los botones correspondientes con su propia funcionalidad, entre otros.
 */


final controladorUsuario = TextEditingController();
final controladorClave = TextEditingController();

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    conectarSocket();
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {


  bool checkBoxValue = false;

  Widget crearEmailInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        controller: controladorUsuario,
        decoration: InputDecoration(
            labelText: 'Usuario',
            hintText: 'Ingrese su nombre de usuario..'),
      ),
    );
  }

  Widget crearClaveInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: controladorClave,
        decoration: InputDecoration(
            labelText: 'Contraseña',
            hintText: 'Ingrese su contraseña..'),
        obscureText: true,
      ),
    );
  }

  Widget crearBotonLogin() {
    return Container(
        padding: const EdgeInsets.only(top: 20),
        child: RaisedButton(
          child: Text('Iniciar sesión'),
          onPressed: () {
            loguearse();
            recibirConfirmacion();
          },
        ));
  }

  void loguearse() {
    globals.socket.write(controladorUsuario.text + ',' + controladorClave.text);
  }

  void recibirConfirmacion() {
    globals.socket.listen((data) {
      if(Utf8Decoder().convert(data).contains('OK'))
        {
          globals.prefs.setBool('logued', true);
          Navigator.pushNamed(context, '/principal');
        }
    });
  }

  Widget renderClaveLink() {
    // TODO Funcionalidad a desarrollar
    return Container(
        padding: EdgeInsets.only(top: 24),
        child: Text(
          '¿Has olvidado la contraseña?',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
    firebaseMessaging.subscribeToTopic('todos');

    cargarGuardados() async {
      globals.prefs = await SharedPreferences.getInstance();
      if (globals.prefs.getBool('logued')) {
        Navigator.pushNamed(context, '/principal');
      }
    }

    cargarGuardados();


    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(children: [
          Image.asset(
            'assets/logoArduino.jpeg',
            width: 480.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          crearEmailInput(),
          crearClaveInput(),
          SizedBox(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Checkbox(
                    value: checkBoxValue,
                    onChanged: (bool value) {
                      setState(() {
                        checkBoxValue = value;
                      });
                    }),
                Center(
                  child: Text("Recordar usuario y contraseña"),
                )
              ],
            ),
          ),
          crearBotonLogin(),
          renderClaveLink()
        ]),
      ),
    );
  }
}

void conectarSocket() async {
  Socket.connect(globals.ipServidor, globals.puerto).then((Socket sock) {
    globals.socket = sock;
  }).catchError((AsyncError e) {
    print("No se pudo establecer la conexión: $e");
  });
}

