import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantalla_principal/NotificationScreen.dart';
import 'package:pantalla_principal/LocalNotificationScreen.dart';
import 'package:pantalla_principal/estado_advertencia.dart';
import 'package:pantalla_principal/estado_en_curso.dart';
import 'package:pantalla_principal/estado_en_espera.dart';
import 'package:pantalla_principal/estado_finalizado.dart';
import 'package:pantalla_principal/estado_advertencia.dart';
import 'package:pantalla_principal/hist_page.dart';
import 'package:pantalla_principal/main_Pant_Principal.dart';
import 'package:pantalla_principal/retro_page.dart';
import 'ajustes_page.dart';
import 'ayuda_page.dart';
import 'horario_page/main_horario.dart';
import 'manual_page.dart';
import 'login.dart';

import 'package:pantalla_principal/Splashscreen.dart';

/*
  Este archivo 'main.dart' es el primero que se ejecuta al abrirse la aplicación.
  Es un widget en el cual se definen varias propiedades de dicha pantalla tales como:
  la imágen referente al logo de esta aplicación, el/los íconos que aparecerán,
  las rutas para transicionar a las diferentes pantallas, entre otras.
*/


/*
  Esta función main() llama a runApp() tomando cualquier widget como argumento
  para poder crear el diseño de la pantalla.
*/
void main() {
  runApp((new MaterialApp(
    routes: {
      '/principal': (context) => MyApp(),
    },
    home: HomeApp(),
  )));
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,  // color del ícono de carga del Splashscreen
        ),

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
        home: Splashscreen()
        );
  }
}
