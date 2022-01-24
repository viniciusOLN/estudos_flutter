import 'package:flutter/material.dart';

class TextoFormatado extends StatelessWidget {
  String titulo;
  TextoFormatado(this.titulo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        titulo,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(71, 71, 71, 0.8),
        ),
      ),
    );
  }
}
