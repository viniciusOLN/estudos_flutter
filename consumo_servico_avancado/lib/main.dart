import 'package:flutter/material.dart';
// import 'pagina_inicial.dart';
import 'testes/pagina_inicial.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({Key key}) : super(key: key);

  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumo de Serviços Avançados',
      home: PaginaInicial(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
