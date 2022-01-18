import 'package:flutter/material.dart';
import 'package:pmu_app_funcionalidade/pages/pagina_inicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Funcionalidade do Minha uespi',
      debugShowCheckedModeBanner: false,
      home: PaginaInicial(),
    );
  }
}
