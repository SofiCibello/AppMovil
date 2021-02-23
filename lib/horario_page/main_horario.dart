import 'package:pantalla_principal/horario_page/models/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../ajustes_page.dart';
import '../ayuda_page.dart';
import '../estado_advertencia.dart';
import '../estado_en_curso.dart';
import '../estado_en_espera.dart';
import '../estado_finalizado.dart';
import '../hist_page.dart';
import '../main.dart';
import '../main_Pant_Principal.dart';
import '../manual_page.dart';
import '../retro_page.dart';
import 'views/homepage.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main_horario() async {

  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
  AndroidInitializationSettings('codex_logo');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
        if (payload != null) {
          debugPrint('notification payload: ' + payload);
        }
      });
  runApp(Horario());
}


class Horario extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        '/principal': (context) => MyApp(),
        '/ajustes': (context) => Ajustes(),
        '/ayuda': (context) => Ayuda(),
        '/retro': (context) => Retro(),

        // Rutas correspondientes a los botones
        '/horario': (context) => Horario(),
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

      title: 'horario_page',
      theme: ThemeData(
        primarySwatch: Colors.green, // color del botón 'Guardar'
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context) => MenuInfo(MenuType.reloj),
        child: HomePageHorario(),
      ),
    );
  }
}
