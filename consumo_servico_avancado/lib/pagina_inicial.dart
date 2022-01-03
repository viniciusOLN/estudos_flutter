import 'dart:convert';
import 'package:consumo_servico_avancado/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  String _urlBase = "https://jsonplaceholder.typicode.com";
  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(_urlBase + "/posts");
    var dadosJson = json.decode(response.body);

    List<Post> postagens = [];
    for (var post in dadosJson) {
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    return postagens;
  }

  //adiciona um novo dado na api
  _post() async {
    var corpo = json.encode(
      {
        "userId": 10,
        "id": null,
        "title": "titulo",
        "body": "corpo da postagem",
      },
    );
    http.Response response = await http.post(
      _urlBase + "/posts",
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpo,
    );

    print(response.body);
  }

  //chamado de put, ele atualiza os dados de um determinado objeto na api
  _atualizar() async {
    var corpo = json.encode(
      {
        "userId": 10,
        "id": null,
        "title": "titulo alterado",
        "body": "corpo da postagem alterada",
      },
    );
    int id = 100;
    http.Response response = await http.put(
      _urlBase + "/posts/${id}",
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpo,
    );

    print(response.statusCode);
    print(response.body);
  }

  //atualiza os dados de um objeto em uma determinada api, sem precisar mudar tudo, só 1 atributo
  _patch() async {
    var corpo = json.encode(
      {
        "userId": 10,
        "body": "corpo da postagem alterada",
      },
    );
    int id = 100;
    http.Response response = await http.patch(
      _urlBase + "/posts/${id}",
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpo,
    );

    print(response.statusCode);
    print(response.body);
  }

  //chamddo de delete, ele deleta uma ocorrencia na api
  _remover() async {
    var corpo = json.encode(
      {
        "userId": 10,
        "body": "corpo da postagem alterada",
      },
    );
    int id = 2;
    http.Response response = await http.delete(_urlBase + "/posts/${id}");

    print(response.statusCode);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ElevatedButton(
                  child: Text("Salvar"),
                  onPressed: _post,
                ),
                Padding(padding: EdgeInsets.all(5)),
                ElevatedButton(
                  child: Text("Atualizar"),
                  onPressed: _patch,
                ),
                Padding(padding: EdgeInsets.all(5)),
                ElevatedButton(
                  child: Text("Remover"),
                  onPressed: _remover,
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                  future: _recuperarPostagens(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                        break;
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          print(snapshot.error);
                          print("Erro ao carregar a lista");
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, indice) {
                              return ListTile(
                                title: Text(snapshot.data[indice].title),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title:
                                            Text(snapshot.data[indice].title),
                                        content:
                                            Text(snapshot.data[indice].body),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          );
                        }
                        break;
                    }
                    return Container();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
