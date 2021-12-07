// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  TextEditingController _campoGasolina = TextEditingController();
  TextEditingController _campoAlcool = TextEditingController();
  String _texto = "";

  void _calcular() {
    double campoAlcool = double.tryParse(_campoAlcool.text);
    double campoGasolina = double.tryParse(_campoGasolina.text);

    if (campoAlcool == null || campoGasolina == null) {
      setState(() {
        _texto = "Informe um número inválido, por favor!(Somente com ponto)";
      });
    } else {
      if ((campoAlcool / campoGasolina) >= 0.7) {
        setState(() {
          _texto = "Gasolina é mais viável";
        });
      } else if ((campoAlcool / campoGasolina) <= 0.7) {
        setState(() {
          _texto = "Álcool é mais viável!";
        });
      } else {
        setState(() {
          _texto = "Os dois são viáveis";
        });
      }
      _limparCampos();
    }
  }

  void _limparCampos() {
    setState(() {
      _campoAlcool.text = "";
      _campoGasolina.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset("images/logo.png"),
              Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              TextField(
                controller: _campoGasolina,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preço da gasolina, ex: 3.40',
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: _campoAlcool,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preço do Álcool, ex: 5.50',
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: _calcular,
                child: Text('Calcular', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.all(15),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  _texto,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
