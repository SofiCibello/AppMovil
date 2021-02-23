import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'globals.dart' as globals;


final controladorMessage = TextEditingController();

class Retro extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.red[900],
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(  // nombre correspondiente a esta pantalla
              'Feedback',
              style: TextStyle(color: Colors.white),
            ),
            leading: IconButton(
              onPressed: () {Navigator.pop(context);},
              icon: Icon(Icons.arrow_back),   // flecha para volver al Menú principal
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10.0),
                Text(
                  'Indique la categoría correspondiente con su problema:',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 25.0),
                buildCheckOption('Acerca del funcionamiento de "Smart Guardian"'),
                buildCheckOption('Acerca del funcionamiento de la aplicación'),
                buildCheckOption('Acerca del inicio de sesión'),
                buildCheckOption('Otros problemas'),
                buildCheckOption('Sugerencias'),
                SizedBox(height: 10.0),
                buildFeedbackForm(),
                SizedBox(height: 10.0),
                Spacer(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          globals.sendMessage('>>> Feedback: ' + controladorMessage.text);  // Esta función envía un mensaje al Servidor
                          Fluttertoast.showToast(
                            msg: "Su solicitud ha sido enviada con éxito",
                          );
                          controladorMessage.text = '';  // Esta función borra la solicitud del cuadro de texto, una vez que se haya enviado dicho mensaje al Servidor
                          Navigator.pushNamed(context, '/principal');  // Esta función transiciona a la pantalla del Menú principal
                        },
                        color: Colors
                            .green[600],
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'ENVIAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  buildCheckOption(titulo) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.check_circle_rounded,
            color: Colors.red[700],
          ),
          SizedBox(width: 10.0),
          Text(
            titulo,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }

  buildFeedbackForm() {
    return Container(
      height: 200.0,
      child: Stack(
        children: <Widget>[
          TextField(
            controller: controladorMessage,
            maxLines: 10,
            decoration: InputDecoration(
              hintText:
              'Describa su problema para que podamos resolverlo lo antes posible',
              hintStyle: TextStyle(
                fontSize: 13.0,
                color: Color(0xffc5c5c5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe5e5e5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}