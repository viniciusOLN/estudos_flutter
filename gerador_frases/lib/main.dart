// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeStateful(),
    );
  }
}

class HomeStateful extends StatefulWidget {
  const HomeStateful({Key? key}) : super(key: key);

  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  final _titulo = "Gerador de Frases";
  String _fraseGerada = "Clique no botão para gerar uma frase aleatória!";

  final List<String> _frases = [
    "Bom dia, o sol já nasceu lá na fazendinha",
    "A vida é dura beleza galera",
    "Precisamos ser constantemente a melhor versão de nós mesmos",
    "Se os carros são como as lanchas e as motos como jetskis, os peixes são como cachorros?",
    "Sono reina neste momento meudeus que preguiça",
    "É verdade que o sabiá sabia assobiá?",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(_titulo)),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset("images/arquivos-necessarios/logo.png"),
              Text(
                _fraseGerada,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.justify,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _fraseGerada = _frases[Random().nextInt(_frases.length)];
                  });
                },
                child: Text(
                  "Gerar nova frase",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ]),
      ),
    );
  }
}
