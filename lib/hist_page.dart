import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'globals.dart' as globals;
import 'dart:convert';

class Historial extends StatefulWidget {
  @override
  _Historial createState() => _Historial();
}

class _Historial extends State<Historial> {
  bool obtenido = false;
  List<double> widths = [90, 70, 180];
  List<List<String>> listaPermanencias = [
    ["Fecha", "Hora", "Descripción"]
  ];

  @override
  Widget build(BuildContext context) {
    conectarSocket();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
            // flecha para volver al Menú Principal
            color: Colors.white),
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Text(
          'Historial',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 15,
            ),
            for (int i = 0; i < listaPermanencias.length; i++)
              Container(
                height: 37,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 15,
                        ),
                        if (i == 0)
                          for (int j = 0; j < listaPermanencias[i].length; j++)
                            Container(
                              width: widths[j],
                              child: Text(listaPermanencias[i][j],
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                        if (i != 0)
                          for (int j = 0; j < listaPermanencias[i].length; j++)
                            Container(
                              width: widths[j],
                              child: Text(listaPermanencias[i][j],
                                  style: TextStyle(fontSize: 18.0)),
                            ),
                      ],
                    ),
                    Divider(color: Colors.black)
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  void conectarSocket() async {
    if (!obtenido) {
      globals.socket.close();
      obtenido = true;
      Socket.connect(globals.ipServidor, globals.puerto).then((Socket sock) {
        globals.socket = sock;
        globals.socket.write("Historial");
        globals.socket.listen((data) {
          String recibido = Utf8Decoder().convert(data);
          List<String> filas = recibido.split("&");
          List<List<String>> tabla = [
            ["Fecha", "Hora", "Descripción"]
          ];
          for (var i = 0; i < filas.length; i++) {
            tabla.add(filas[i].split("%"));
          }
          setState(() {
            listaPermanencias = tabla;
            listaPermanencias.removeLast();
          });
        });
      }).catchError((AsyncError e) {
        print("No se pudo establecer la conexión: $e");
      });
    }
  }
}
