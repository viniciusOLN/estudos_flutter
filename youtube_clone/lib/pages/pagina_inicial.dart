import 'package:youtube_clone/pages/biblioteca.dart';
import 'package:youtube_clone/pages/em_alta.dart';
import 'package:youtube_clone/pages/inicio.dart';
import 'package:youtube_clone/pages/inscricoes.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  int _indiceAtual = 0;

  List<Widget> telas = [
    Inicio(),
    EmAlta(),
    Inscricoes(),
    Biblioteca(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        //cor fixa que se usa ao clicar no item
        //fixedColor: Colors.red,
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        //utilizado pra quando se tem mais de 3 itens, pra tudo não ficar branco
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.blue,
            label: "Inicio",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.green,
            label: "Em Alta",
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            label: "Inscrições",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
