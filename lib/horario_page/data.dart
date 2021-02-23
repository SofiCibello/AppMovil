import 'package:pantalla_principal/horario_page/constants/theme_data.dart';
import 'models/alarm_info.dart';
import 'models/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.reloj,
      title: 'Reloj', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarma,
      title: 'Alarma', imageSource: 'assets/alarm_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(
      alarmDateTime: DateTime.now().add(Duration(hours: 1)),
      title: 'Alarma',
      // title: 'Office', // TODO despues cambiar estoooo !!!
      gradientColorIndex: 0),
  AlarmInfo(
      alarmDateTime: DateTime.now().add(Duration(hours: 2)),
      title: 'Alarma',
      // title: 'Sport', // TODO despues cambiar estoooo !!!
      gradientColorIndex: 1),
];
