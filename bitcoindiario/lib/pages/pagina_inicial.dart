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
  bool _botao = false;

  Future<Map> _verificarPrecoBitcoin() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);

    return json.decode(response.body);
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
              child: FutureBuilder<Map>(
                future: _verificarPrecoBitcoin(),
                builder: (context, snapshot) {
                  String _texto = "";
                  if (_botao) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        // TODO: Handle this case.
                        print("a");
                        break;
                      case ConnectionState.waiting:
                        _texto = "Carregando...";
                        print("carregando");
                        break;
                      case ConnectionState.active:
                        // TODO: Handle this case.
                        print("oi");
                        break;
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          _texto = "Erro ao tentar acessar o valor do bitcoin.";
                        } else {
                          double valor = snapshot.data["BRL"]["buy"];
                          _texto = "R\$" + valor.toString();
                          print("foi");
                          _botao = false;
                        }
                        break;
                    }
                  } else {
                    _texto =
                        "Clique em atualizar para receber o valor atualizado do bitcoin.";
                  }
                  return Text(
                    _texto,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _botao = true;
                });
              },
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
