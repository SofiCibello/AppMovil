import 'dart:ffi';
import 'package:flutter/material.dart';

class Manual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
            color: Colors.white), // flecha para volver al Menú Principal
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Text(
          'Manual',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 30.0, 0, 30.0),
            child: Text(
              'Manual de Usuario',
              textScaleFactor: 2,
              textAlign: TextAlign.center,
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
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: RaisedButton(
              elevation: 5.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              onPressed: () {},
              child: Image.asset(
                'assets/smartcar.png',
                scale: 5.9,
                alignment: Alignment.center,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5.0),
            child: Text(
              'Bienvenido',
              textScaleFactor: 1.8,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 5.0),
            child: Text(
              ' Estimado propietario del Smart Guardian: '
              'Gracias por adquirir un robot inteligente. Usted se ha unido a '
              'las millones de personas que mantienen la seguridad del hogar con estos dispositivos inteligentes. '
              ' Para obtener el mejor rendimiento de Smart Guardian, '
              'tómese un momento para leer este manual y familiarizarse con él. Si tiene alguna duda o consulta, '
              'puede dirigirse a la opción "Feedback" que se encuentra en esta app, para poder obtener más información. '

              'Cuando se registre en esta aplicación, podrá contarnos su experiencia con '
              'su Smart Guardian. En Smart Security, escuchamos a nuestros clientes '
              'y realizamos mejoras a nuestros robots según sus '
              'valiosos comentarios. Nos encantaría recibir noticias '
              'suyas. En nombre de todo el equipo, queremos agraderles por elegirnos.',
              textScaleFactor: 1.5,
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5.0),
            child: Text(
              '¿Qué es Smart Guardian?',
              textScaleFactor: 1.8,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 5.0),
            child: Text(
              ' Es un dispositivo autómata inteligente que está destinado a inspeccionar todos los espacios del hogar, '
              'ya sea en situaciones en las que queda en ausencia de personas o durante horarios nocturnos '
              'cuando los habitantes de dicho domicilio quedan imposibilitados de alertarse y de detectar '
              'alguna situación imprevista.',
              textScaleFactor: 1.5,
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5.0),
            child: Text(
              '¿Cómo funciona?',
              textScaleFactor: 1.8,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 5.0),
            child: Text(
              ' Recorre un circuito, el cual será guiado por un sensor de '
              'distancias que evitará colisionar con las paredes u obstáculos. '
              'En este recorrido, el dispositivo se encargará de controlar movimientos '
              'y medir los niveles de humo y gas.'
              ' Para que comience su recorrido, se podrá elegir un horario e inicializarlo, '
              'o simplemente iniciarlo cuando se desee, sin ninguna hora preestablecida.',
              textScaleFactor: 1.5,
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5.0),
            child: Text(
              '¿Qué es Smart Security?',
              textScaleFactor: 1.8,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 5.0),
            child: Text(
              ' Es una aplicación móvil desarrollada para controlar y monitorizar el comportamiento del dispositivo Smart Guardian. '
              'Ésta aplicación permite elegir una hora de inicio, controlar el estado del mismo'
              ' y mantenerse informados por los diferentes datos recolectados por Smart Guardian.',
              textScaleFactor: 1.5,
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5.0),
            child: Text(
              'Restricciones de uso',
              textScaleFactor: 1.8,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 5.0),
            child: Text(
              '''
-Su robot no es un juguete. No se siente ni se pare sobre éste dispositivo.
-Los niños pequeños y las mascotas deben tener supervisión cuando el robot esté en funcionamiento.
-Almacene y utilice su robot sólamente a temperatura ambiente.
-Limpielo si es necesario con un paño húmedo o en lo posible seco.
-Antes de utilizar este dispositivo despeje los espacios por donde andará el mismo, recoja objetos como ropa, papeles sueltos, cables de energía y cualquier objeto frágil. 
-Si la sala que se vigila contiene un balcón, se debe utilizar una barrera física para impedir su paso. 
-No coloque ningún objeto sobre su robot. 
-Tenga en cuenta que el robot al ser un dispositivo autómata inteligente,  
se mueve por sí solo. Tenga cuidado en caso de caminar por el área cercana.''',
              textScaleFactor: 1.5,
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5.0),
            child: Text(
              'Encendido y Apagado',
              textScaleFactor: 1.8,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 5.0),
            child: Text(
              '''
• Para encender al dispositivo Smart Guardian, presione el botón "Comenzar", indicando de esta forma el inicio del recorrido.
• Para apagar el dispositivo Smart Guardian, presione el botón Finalizar.''',
              textScaleFactor: 1.5,
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5.0),
            child: Text(
              'Notificaciones',
              textScaleFactor: 1.8,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 5.0),
            child: Text(
              'El sistema de notificaciones que tiene Smart Security es el de las llamadas Notificaciones Push.'
              ' Las notificaciones llegarán a la aplicación móvil una vez que el robot detecte anomalías, en base a los datos capturados por los sensores'
              ', las mismas se visualizarán en el dispositivo móvil del usuario para que éste se alerte de lo que ocurre.',
              textScaleFactor: 1.5,
              textAlign: TextAlign.justify,
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
