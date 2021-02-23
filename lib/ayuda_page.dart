import 'dart:ffi';
import 'package:flutter/material.dart';

/*
  Este archivo 'ayuda_page.dart' corresponde a la pantalla de 'Ayuda',
  la cual muestra una breve descripción de lo que hace cada botón del Menú Principal,
  para que el usuario de esta aplicación pueda acudir a ella en cualquier momento.
 */

class Ayuda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Text(  // nombre correspondiente a esta pantalla
          'Ayuda',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(150.0, 20.0, 0, 20.0),
            child: Text(
              'Funciones',
              textScaleFactor: 1.6,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          _buildDivider(),
          const SizedBox(height: 20.0),

          Container(
            margin: EdgeInsets.fromLTRB(150.0, 0.0, 0, 5.0),
            child: Text(
              'Manual',
              textScaleFactor: 1.5,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 130),
            child: RaisedButton(
              elevation: 5.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              onPressed: () {},
              child: Image.asset('assets/manual.png', scale: 5.9),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
            child: Text(
                'Permite consultar información sobre el dispositivo Smart Guardian, en cuanto a especificaciones del mismo y formas de utilización.'
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(160.0, 0.0, 0, 5.0),
            child: Text(
              'Horario',
              textScaleFactor: 1.5,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 130),
            child: RaisedButton(
              elevation: 5.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              onPressed: () {},
              child: Image.asset('assets/programar.png', scale: 5.9),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
            child: Text(
                'Permite configurar un horario específico para el inicio automático del recorrido de control.'
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(160.0, 0.0, 0, 5.0),
            child: Text(
              'Estado',
              textScaleFactor: 1.5,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 130),
            child: RaisedButton(
              elevation: 5.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              onPressed: () {},
              child: Image.asset('assets/estado.png', scale: 5.9),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
            child: Text(
                'Permite visualizar en tiempo real el estado actual de Smart Guardian, pudiendo ser: “En curso”, “En espera”, “Finalizado” o “Sin conexión”.'
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(158.0, 0.0, 0, 5.0),
            child: Text(
              'Historial',
              textScaleFactor: 1.5,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 130),
            child: RaisedButton(
              elevation: 5.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              onPressed: () {},
              child: Image.asset('assets/historial.png', scale: 5.9),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
            child: Text(
                'Permite visualizar en tiempo real la fecha, la hora y una breve descripción de lo que se va detectando en cada recorrido, indicando también cuando dicho recorrido fue completado con éxito, y cuando el usuario lo detuvo manualmente.'
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(150.0, 0.0, 0, 5.0),
            child: Text(
              'Comenzar',
              textScaleFactor: 1.5,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 130),
            child: RaisedButton(
              elevation: 5.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              onPressed: () {},
              child: Image.asset('assets/tocar.png', scale: 5.9),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
            child: Text(
                'Permite poner en ejecución a Smart Guardian y dar comienzo al recorrido de forma manual.'
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(139.0, 0.0, 0, 5.0),
            child: Text(
              'Desconectar',
              textScaleFactor: 1.5,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 130),
            child: RaisedButton(
              elevation: 5.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              onPressed: () {},
              child: Image.asset('assets/apagado.png', scale: 5.9),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
            child: Text(
                'Permite parar la ejecución de Smart Guardian y dar por finalizado el recorrido de forma manual.'),
          ),
        ],
      ),
    );
  }

  Container _buildDivider(){
    return Container(margin: const EdgeInsets.symmetric(horizontal: 8.0,),
        width: double.infinity,
        height: 1.0,
        color: Colors.grey.shade400
    );
  }
}