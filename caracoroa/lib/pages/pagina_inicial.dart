import 'package:flutter/material.dart';
import 'package:caracoroa/pages/pagina_sorteio.dart';
import 'dart:math';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  int _caraOuCoroa() {
    return Random().nextInt(2);
  }

  void _redirecionarPagina() {
    int num = _caraOuCoroa();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaginaSorteio(num)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfff61bd86),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png"),
            Padding(padding: EdgeInsets.all(10)),
            GestureDetector(
              onTap: _redirecionarPagina,
              child: Image.asset("images/botao_jogar.png"),
            ),
          ],
        ),
      ),
    );
  }
}
