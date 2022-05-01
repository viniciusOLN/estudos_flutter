import 'package:consumo_servico_avancado/testes/postagens.dart';
import 'package:flutter/material.dart';

Post adicionarPost(context) {
  Post _novoPost = Post('', '', '', '');
  showDialog(
    context: context,
    builder: (context) {
      TextEditingController _controllerTitulo = TextEditingController();
      TextEditingController _controllerAutor = TextEditingController();
      TextEditingController _controllerSobre = TextEditingController();
      TextEditingController _controllerTexto = TextEditingController();
      return AlertDialog(
        title: Text("Deseja adicionar um novo post ?"),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: _controllerTitulo,
                  decoration: InputDecoration(
                    label: Text("Título do post"),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: _controllerSobre,
                  decoration: InputDecoration(
                    label: Text("Sobre o post"),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: _controllerTexto,
                  decoration: InputDecoration(
                    label: Text("Texto da postagem"),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: _controllerAutor,
                  decoration: InputDecoration(
                    label: Text("Autor"),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_controllerTexto.text != "" &&
                      _controllerTitulo.text != "" &&
                      _controllerSobre.text != "" &&
                      _controllerTexto.text != "" &&
                      _controllerAutor.text != "") {
                    _novoPost = Post(
                        _controllerAutor.text,
                        _controllerTexto.text,
                        _controllerSobre.text,
                        _controllerTitulo.text);
                    Navigator.pop(context);
                  }
                },
                child: Text("Adicionar novo post"),
              ),
            ],
          ),
        ),
      );
    },
  );
  return _novoPost;
}
