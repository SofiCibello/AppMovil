import 'package:flutter/cupertino.dart';
import 'package:pantalla_principal/horario_page/constants/theme_data.dart';
import 'package:pantalla_principal/horario_page/data.dart';
import 'package:pantalla_principal/horario_page/models/menu_info.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pantalla_principal/horario_page/views/reloj_view.dart';
// import 'file:///C:/Users/Sofia/AndroidStudioProjects/pantalla_principal/lib/horario_page/views/reloj_view.dart';
import 'package:provider/provider.dart';
import 'package:pantalla_principal/horario_page/views/alarma_page.dart';
import 'package:pantalla_principal/horario_page/views/reloj_page.dart';


class HomePageHorario extends StatefulWidget {
  @override
  _HomePageHorarioState createState() => _HomePageHorarioState();
}

class _HomePageHorarioState extends State<HomePageHorario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // color de fondo de pantalla

      // diseño del encabezado de esta pantalla
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.red[900],
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Horario',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {Navigator.pushNamed(context,'/principal');},
          icon: Icon(Icons.arrow_back),
        ),
      ),

      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
          ),
          VerticalDivider(
            // color: CustomColors.dividerColor,
            color: Colors.grey[600],
            width: 1,

          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget child) {
                if (value.menuType == MenuType.reloj)
                  return RelojPage();
                else if (value.menuType == MenuType.alarma)
                  return AlarmaPage();
                else // TODO despues borrar esto !!!
                  return Container(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: 'Upcoming Tutorial\n'),
                          TextSpan(
                            text: value.title,
                            style: TextStyle(fontSize: 48),
                          ),
                        ],
                      ),
                    ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }


  // A continuacion se establece una funcion que diseña el menu vertical
  // , el cual se situa en el lateral izquierdo de esta pantalla
  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget child) {
        return FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(32))
          ),
          padding: const EdgeInsets.symmetric(vertical : 16.0, horizontal: 0),
          color: currentMenuInfo.menuType == value.menuType
              ?   Colors.grey[400]
              // ? CustomColors.menuBackgroundColor
              : Colors.transparent,
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Column(
            children: <Widget>[
              Image.asset(
                currentMenuInfo.imageSource,
                scale: 1.5,
              ),
              SizedBox(height: 16),
              Text(
                currentMenuInfo.title ?? '',
                style: TextStyle(
                    fontFamily: 'avenir',
                    color: Colors.black,
                    fontSize: 15),
              ),
            ],
          ),
        );
      },
    );
  }

}
