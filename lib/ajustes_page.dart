import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
  Este archivo 'ajustes_page.dart' corresponde a la pantalla de 'Ajustes',
  la cual permite activar o desactivar ciertas funciones de los sensores
  y configurar las notificaciones generadas desde la aplicación.
 */

void main() {
  runApp(Ajustes());
}

class Ajustes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.red[900],
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          // nombre correspondiente a esta pantalla
          'Ajustes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 5.0,
                  margin: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 2.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                const SizedBox(height: 20.0),

                Text(
                  'Ajustes de Notificaciones',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15.0),
                SwitchListTile(
                  dense: true,
                  activeColor: Colors.red[700],
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text(
                    'Mostrar notificaciones en la pantalla de bloqueo',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (val) {},
                ),
                SwitchListTile(
                  dense: true,
                  activeColor: Colors.red[700],
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text(
                    'Permitir que las notificaciones reproduzcan sonidos',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (val) {},
                ),
                const SizedBox(height: 30.0),

                _buildDivider(),

                const SizedBox(height: 30.0),
                Text(
                  'Ajustes de Sensores',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15.0),
                SwitchListTile(
                  dense: true,
                  activeColor: Colors.red[700],
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text(
                    'Sensor de movimiento',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (val) {},
                ),
                SwitchListTile(
                  dense: true,
                  activeColor: Colors.red[700],
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text(
                    'Sensor de distancias',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (val) {},
                ),
                SwitchListTile(
                  dense: true,
                  activeColor: Colors.red[700],
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text(
                    'Sensor de gas',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (val) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        width: double.infinity,
        height: 1.0,
        color: Colors.grey.shade400);
  }
}
