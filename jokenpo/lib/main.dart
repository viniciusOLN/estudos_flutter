import 'package:flutter/material.dart';
import 'package:jokenpo/app/pages/pagina_inicial.dart';

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
