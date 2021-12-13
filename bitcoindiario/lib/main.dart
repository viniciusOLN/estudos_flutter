import 'package:bitcoindiario/pages/pagina_inicial.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyProject());
}

class MyProject extends StatefulWidget {
  const MyProject({Key key}) : super(key: key);

  @override
  _MyProjectState createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Diário',
      debugShowCheckedModeBanner: false,
      home: PaginaInicial(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}
