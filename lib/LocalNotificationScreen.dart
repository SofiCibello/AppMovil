import 'package:flutter/material.dart';
import 'package:pantalla_principal/NotificationPlugin.dart';
import 'package:pantalla_principal/NotificationScreen.dart';

class LocalNotificationScreen extends StatefulWidget {
  @override
  _LocalNotificationScreenState createState() =>
      _LocalNotificationScreenState();
}

class _LocalNotificationScreenState extends State<LocalNotificationScreen> {

  int count = 0;

  @override
  void initState() {
    super.initState();
    notificationPlugin
        .setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Notificaciones'),
        centerTitle: true,
      ),
      body: Center(
        child: FlatButton(
          onPressed: () async {
            await notificationPlugin.showNotification();

            await notificationPlugin.showNotificationWithAttachment();

          },
          child: Text('Enviar Notificación'),
        ),
      ),
    );
  }

  onNotificationInLowerVersions(ReceivedNotification receivedNotification) {
    print('Notificación recibida ${receivedNotification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload $payload');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NotificationScreen(
        payload: payload,
      );
    }));
  }
}