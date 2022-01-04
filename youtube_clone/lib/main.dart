import 'package:flutter/material.dart';
import 'pages/pagina_inicial.dart';

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
    return MaterialApp(
      title: 'Clone Youtube',
      debugShowCheckedModeBanner: false,
      home: PaginaInicial(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
