library my_prj.globals;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart' as globals;

/*
  En este archivo 'globals.dart' se guardan todas las variables globales
  que van a ser utilizadas en las diversas pantallas.
*/

// ----- PARÁMETROS INICIALES -----
String ipServidor = '192.168.0.112'; // --> Es importante que la IP de la variable sea la misma que esta asociada al servidor
int puerto = 11000;
String nombre = 'Sofía Cibello';

// ----- VARIABLES DE SISTEMA -----
//  (No es necesario modificarlas)
SharedPreferences prefs;
String usuario;
Socket socket;
String respuesta = '';


// ----- FUNCIÓN GLOBAL -----
// Esta función se comunica con el Servidor, enviandole información de cada botón
void sendMessage(String message) {
  globals.socket.write(message);
}


void conectarSocket() async {
  Socket.connect(globals.ipServidor, globals.puerto).then((Socket sock) {
    globals.socket = sock;
  }).catchError((AsyncError e) {
    print("No se pudo establecer la conexión: $e");
  });
}