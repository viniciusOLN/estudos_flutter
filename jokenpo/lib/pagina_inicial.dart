import 'package:flutter/material.dart';
import 'dart:math';
import 'controller_jogo.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  String _imagemDoMomento = "padrao";
  String _mensagem = "Escolha uma opção abaixo!";
  ControllerJogo controller = ControllerJogo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Jokenpo')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text('Escolha do App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Image.asset(
            "images/$_imagemDoMomento.png",
            height: 95,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(_mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _imagemDoMomento = controller.gerarJogadaApp();
                    _mensagem = controller.VerificarJogada("pedra");
                  });
                },
                child: Image.asset(
                  "images/pedra.png",
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _imagemDoMomento = controller.gerarJogadaApp();
                    _mensagem = controller.VerificarJogada("papel");
                  });
                },
                child: Image.asset(
                  "images/papel.png",
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _imagemDoMomento = controller.gerarJogadaApp();
                    _mensagem = controller.VerificarJogada("tesoura");
                  });
                },
                child: Image.asset(
                  "images/tesoura.png",
                  height: 95,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
