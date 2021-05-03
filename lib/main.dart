import 'package:flutter/material.dart';
import 'package:examen_leonardo_macias/icon.dart';
import 'package:examen_leonardo_macias/menu.dart';
import 'package:flutter/services.dart';

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
        title: Text("Proyecto Departamental"),
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
          showDialog(
            context: letra,
            builder: (BuildContext letra) =>
                _imprimirdialogo(letra, opt['texto']),
          );
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }

  Widget _imprimirdialogo(BuildContext letra, String opt) {
    return new AlertDialog(
      title: const Text('click '),
      content: new Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('opcion:' + opt),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(letra).pop();
          },
          textColor: Theme.of(letra).primaryColorDark,
          child: const Text('close'),
        ),
      ],
    );
  }
}
