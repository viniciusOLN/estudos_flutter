import 'package:flutter/material.dart';
import 'pages/pagina_principal.dart';

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
      title: 'ATM consultoria',
      home: PaginaPrincipal(),
      debugShowCheckedModeBanner: false,
    );
  }
}
