import 'package:flutter/material.dart';
import 'pagina_inicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Encontrar CEP',
      debugShowCheckedModeBanner: false,
      home: PaginaInicial(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
