import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Bitcoin {
  int valorAtual;

  void AcessarValorAtual(String nome) async {
    String url = "blockchain.info/ticker";
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);

    return retorno["BRL"]["buy"];
  }
}
