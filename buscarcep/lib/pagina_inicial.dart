import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  TextEditingController _cep = TextEditingController();
  String _resultado = "";

  void _recuperarCEP() async {
    String url = "https://viacep.com.br/ws/${_cep.text}/json/";

    http.Response response;
    response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> decodificado = json.decode(response.body);
      String logradouro = (decodificado["logradouro"] == "")
          ? "não informado"
          : decodificado["logradouro"];
      String ddd =
          (decodificado["ddd"] == "") ? "não informado" : decodificado["ddd"];
      String localidade = (decodificado["localidade"] == "")
          ? "não informado"
          : decodificado["localidade"];
      String bairro = (decodificado["bairro"] == "")
          ? "não informado"
          : decodificado["bairro"];

      setState(() {
        _resultado =
            "localidadade: ${localidade} - logradouro: ${logradouro} - ddd:[${ddd}] - bairro: ${bairro}";
      });
    } else {
      setState(() {
        _resultado = "Erro ao pesquisar o CEP, por favor digite um CEP válido!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white54,
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(
                  "MEU CEP",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue.shade400,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: _cep,
                decoration: InputDecoration(
                  labelText: "Digite o CEP que deseja",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text("Encontrar CEP", style: TextStyle(fontSize: 20)),
              ),
              onPressed: _recuperarCEP,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 0),
                child: Text(_resultado),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
