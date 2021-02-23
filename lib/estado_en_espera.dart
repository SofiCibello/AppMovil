import 'dart:ffi';
import 'package:flutter/material.dart';

class EnEspera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData( // flecha(ícono) para volver al Menú Principal
        color: Colors.white),
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Text(
          'Estado',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:Center(
        heightFactor: 21,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text('En espera',style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),), SizedBox(height: 35,), Image.asset('assets/enespera.png' ,width: 300,scale: 2,), ],
        ),
      ),
    );

  }
}
