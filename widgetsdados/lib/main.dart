import 'package:flutter/material.dart';
import 'pagina_principal.dart';
import 'radio_buttons.dart';
import 'switch_estudo.dart';
import 'slider_estudo.dart';
import 'navegacao_telas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testando inputs',
      home: Navegacao(),
      debugShowCheckedModeBanner: false,
    );
  }
}
