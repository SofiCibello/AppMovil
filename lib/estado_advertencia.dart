import 'dart:ffi';
import 'package:flutter/material.dart';

class Advertencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(  // flecha(ícono) para volver al Menú Principal
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
          children: [Text('Sin conexión',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),), SizedBox(height: 35,), Image.asset('assets/danger.png' ,width: 300,scale: 2,), ],
        ),
      ),
    );

  }
}
