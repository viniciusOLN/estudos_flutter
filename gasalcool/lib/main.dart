import 'package:flutter/material.dart';
import './page_principal.dart';

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
      title: 'Gás ou Álcool',
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}
