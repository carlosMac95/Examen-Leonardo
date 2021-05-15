import 'package:flutter/material.dart';
import 'package:examen_leonardo_macias/icon.dart';
import 'package:examen_leonardo_macias/menu.dart';
import 'package:flutter/services.dart';
import 'package:examen_leonardo_macias/page_alert.dart';
import 'package:examen_leonardo_macias/page_avatar.dart';
import 'package:examen_leonardo_macias/page_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext letra) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Departamental',
      theme: ThemeData(
        primarySwatch: Colors.yellow
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext letra) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practica Navigation"),
      ),
      body: _listas(letra),
    );
  }

  Widget _listas(BuildContext letra) {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, letra),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext letra) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right_outlined),
        onTap: () {
          if (opt['ruta'] == 'alert') {
            final route = MaterialPageRoute(builder: (context) => AlertPage());
            Navigator.push(letra, route);
          } else if (opt['ruta'] == 'avatar') {
            final route = MaterialPageRoute(builder: (context) => AvatarPage());
            Navigator.push(letra, route);
          } else if (opt['ruta'] == 'card') {
            final route = MaterialPageRoute(builder: (context) => CardsPage());
            Navigator.push(letra, route);
          } else {
            // _buildPopUpDialog(context, opt['texto']),
          }
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
}
       