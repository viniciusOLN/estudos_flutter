import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  String _texto =
      "Clique em atualizar para receber o valor atualizado do bitcoin.";

  void _verificarPrecoBitcoin() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      _texto = "R\$ ${retorno["BRL"]["buy"].toString()}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset("images/bitcoin.png"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 0),
              child: Text(
                _texto,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _verificarPrecoBitcoin,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  "Atualizar",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
