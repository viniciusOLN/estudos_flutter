import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  Future<Map> _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
        future: _recuperarPreco(),
        // ignore: missing_return
        builder: (context, snapshot) {
          String resultado;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              print('conexao active');
              resultado = "Carregando...";
              break;
            case ConnectionState.none:
            case ConnectionState.done:
              print('conexao done');
              if (snapshot.hasError) {
                resultado = "erro ao carregar os dados";
              } else {
                double valor = snapshot.data["BRL"]["buy"];
                resultado = valor.toString();
              }
              break;
          }

          return Center(
            child: Text(resultado),
          );
        });
  }
}
