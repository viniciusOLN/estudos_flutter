import 'package:flutter/material.dart';
import 'package:jokenpo/pagina_inicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokenpo App',
      debugShowCheckedModeBanner: false,
      home: PaginaInicial(),
    );
  }
}
