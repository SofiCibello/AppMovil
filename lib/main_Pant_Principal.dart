import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pantalla_principal/ajustes_page.dart';
import 'package:pantalla_principal/ayuda_page.dart';
import 'package:pantalla_principal/estado_en_curso.dart';
import 'package:pantalla_principal/estado_en_espera.dart';
import 'package:pantalla_principal/estado_finalizado.dart';
import 'package:pantalla_principal/estado_advertencia.dart';
import 'package:pantalla_principal/hist_page.dart';
import 'package:pantalla_principal/retro_page.dart';
import 'package:pantalla_principal/horario_page/main_horario.dart';
import 'package:pantalla_principal/manual_page.dart';
import 'package:pantalla_principal/Splashscreen.dart';
import 'main.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart' as globals;

/*
   Este archivo 'main_Pant_Principal.dart' corresponde a la interfaz del Menú Principal
   de dicha aplicación, en la cual se definen varias propiedades de esta pantalla tales como:
   el título, los íconos, imágenes y botones con sus respectivas funcionalidades,
   las rutas para transicionar a las diferentes pantallas, entre otras.
 */

void main_Pant_Principal(List<String> args) {
  runApp(new MaterialApp(
    // Rutas correspondientes a partir de la pantalla del Menú Principal
    routes: {
      '/principal': (context) => MyApp(),
      '/ajustes': (context) => Ajustes(),
      '/ayuda': (context) => Ayuda(),
      '/retro': (context) => Retro(),
      '/main': (context) => HomeApp(),

      // Rutas correspondientes a los botones del Menú Principal
      '/manual': (context) => Manual(),
      '/horario': (context) => Horario(),
      '/historial': (context) => Historial(),
      '/finalizado': (context) => Finalizado(),
      '/advertencia': (context) => Advertencia(),
      '/encurso': (context) => EnCurso(),
      '/enespera': (context) => EnEspera()
    },
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        /*
          A continuación, se define el diseño de la parte superior de esta pantalla 'Menú Principal',
          la cual mostrará el nombre y el logo de la aplicación,
          un 'sidebar' que contará con dos opciones: 'Feedback' y 'Cerrar sesión'
          con sus respectivas funcionalidades, y los íconos para transicionar
          a la pantalla de Ajustes y a la pantalla de Ayuda con sus respectivas rutas de navegación.
          Además, se definen los botones correspondientes para poder
          interactuar luego con el Arduino y el Servidor.
        */
        title: Text('SMART SECURITY'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.help_outline_outlined),
              tooltip: 'Ayuda',
              iconSize: 25,
              onPressed: () {
                Navigator.pushNamed(context, '/ayuda');
              }),
          new IconButton(
              icon: new Icon(Icons.settings_outlined),
              tooltip: 'Ajustes',
              iconSize: 25,
              onPressed: () {
                Navigator.pushNamed(context, '/ajustes');
              }),
        ],
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.red[800], Colors.red[400]])),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/logo.png',
                          width: 90,
                          height: 80,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'SMART SECURITY',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
            CustomListTile(Icons.text_snippet_rounded, 'Feedback',
                () => {Navigator.pushNamed(context, '/retro')}),
            CustomListTile(
                Icons.logout,
                'Cerrar sesión',
                () => {
                      /*
                Esta instrucción se encarga de cerrar la sesión de un usuario que se encuentra abierta
                en dicho momento, y luego se encarga de transicionar a la pantalla inicial de login.
               */
                      globals.prefs.setBool('logued', false),
                      Navigator.pushNamed(context, '/main')
                    }),
          ],
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 550,
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                MenuPrincipal(
                    onClick: () {
                      Navigator.pushNamed(context, '/manual');
                    },
                    title: 'Manual',
                    icon: new Image.asset(
                      'assets/manual.png',
                      scale: 5.9,
                    )),
                MenuPrincipal(
                    onClick: () {
                      Navigator.pushNamed(context, '/horario');
                    },
                    title: 'Horario',
                    icon: new Image.asset(
                      'assets/programar.png',
                      scale: 5.9,
                    )),
                MenuPrincipal(
                    /*
                      Esta opción corresponde a una interfaz,
                      la cual permite ver el Estado actual del robot.
                    */
                    onClick: () {
                      globals.socket.close();
                      Socket.connect(globals.ipServidor, globals.puerto)
                          .then((Socket sock) {
                        globals.socket = sock;
                        globals.socket.write("estado");
                        globals.socket.listen((data) {
                          String recibido = Utf8Decoder().convert(data);
                          if (recibido.contains("0")) {
                            Navigator.pushNamed(context, '/enespera');
                          }
                          if (recibido.contains("1")) {
                            Navigator.pushNamed(context, '/encurso');
                          }
                          if (recibido.contains("2")) {
                            Navigator.pushNamed(context, '/finalizado');
                          }
                          if (recibido.contains("3")) {
                            Navigator.pushNamed(context, '/advertencia');
                          }
                        });
                      }).catchError((AsyncError e) {
                        print("No se pudo establecer la conexión: $e");
                      });
                    },
                    title: 'Estado',
                    icon: new Image.asset(
                      'assets/estado.png',
                      scale: 5.5,
                    )),
                MenuPrincipal(
                    onClick: () {
                      Navigator.pushNamed(context, '/historial');
                    },
                    title: 'Historial',
                    icon: new Image.asset(
                      'assets/historial.png',
                      scale: 5.9,
                    )),
                MenuPrincipal(
                  onClick: () {
                    Fluttertoast.showToast(
                      msg: "Recorrido iniciado",
                    );
                    globals.sendMessage("iniciar");
                  },
                  title: 'Comenzar',
                  /*
                    Este botón envía las instrucciones correspondientes para
                    poner en ejecución al robot y dar comienzo al recorrido establecido.
                   */
                  icon: new Image.asset(
                    'assets/tocar.png',
                    scale: 6,
                  ),
                ),
                MenuPrincipal(
                  onClick: () {
                    Fluttertoast.showToast(
                      msg: "Recorrido finalizado",
                    );
                    globals.sendMessage("detener");
                  },
                  title: 'Desconectar',
                  /*
                  Este botón envía las instrucciones correspondientes para
                  apagar el dispositivo.
                   */
                  icon: new Image.asset(
                    'assets/apagado.png',
                    scale: 5.9,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuPrincipal extends StatelessWidget {
  var onClick;

  MenuPrincipal({this.title, this.icon, this.onClick});

  final String title;
  final Image icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          onClick();
        },
        splashColor: Colors.red[300],
        child: Center(
          child: Column(
            children: <Widget>[
              Text(title, style: new TextStyle(fontSize: 20.0)),
              Padding(padding: EdgeInsets.all(8), child: icon)
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData icono;
  String texto;
  Function onTap;

  CustomListTile(this.icono, this.texto, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          splashColor: Colors.red[300],
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icono),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        texto,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
