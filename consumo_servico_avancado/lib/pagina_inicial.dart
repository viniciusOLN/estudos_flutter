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
  Future<List<Post>> _recuperarPostagens() async {
    String _urlBase = "https://jsonplaceholder.typicode.com";
    http.Response response = await http.get(_urlBase + "/posts");
    var dadosJson = json.decode(response.body);

    List<Post> postagens = [];
    for (var post in dadosJson) {
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    return postagens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: FutureBuilder<List<Post>>(
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
                                title: Text(snapshot.data[indice].title),
                                content: Text(snapshot.data[indice].body),
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
    );
  }
}
