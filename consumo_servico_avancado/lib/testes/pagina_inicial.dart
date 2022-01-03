import 'package:consumo_servico_avancado/testes/postagens.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  Post p = Post("Vinicius", "corpo da postagem", "isso é sobre a postagem",
      "esse é o titulo");

  List<Post> _postagens = [];

  void _adicionarPost() {
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
                      Post novoPost = Post(
                          _controllerAutor.text,
                          _controllerTexto.text,
                          _controllerSobre.text,
                          _controllerTitulo.text);
                      setState(() {
                        _postagens.add(novoPost);
                      });
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts do dia"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: Text("Adicionar post"),
                  onPressed: _adicionarPost,
                ),
                ElevatedButton(
                  child: Text("Atualizar post"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: Text("Remover post"),
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _postagens.length,
                itemBuilder: (context, indice) {
                  return ListTile(
                    title: Text(_postagens[indice].titulo),
                    leading: Text(_postagens[indice].idPost.toString()),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(_postagens[indice].titulo),
                            titlePadding: EdgeInsets.all(10),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(_postagens[indice].sobre),
                                  Text(_postagens[indice].autor),
                                  Text(_postagens[indice].conteudo),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
