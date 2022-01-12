import 'package:youtube_clone/custom_search_delegate.dart';
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

int _indiceAtual = 0;
String _pesquisa = "";

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_pesquisa),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];

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
            onPressed: () async {
              String result = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
              setState(() {
                _pesquisa = result;
              });
            },
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
          if (_indiceAtual == 0) {
            setState(() {
              _pesquisa = "";
            });
          }
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
