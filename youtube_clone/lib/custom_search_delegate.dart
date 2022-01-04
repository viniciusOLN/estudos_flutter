import 'package:flutter/material.dart';
import 'package:youtube_clone/api/api.dart';
import 'package:youtube_clone/models/video.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  String pesquisa = "Procurar";
  CustomSearchDelegate({this.pesquisa}) : super(searchFieldLabel: pesquisa);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> results = [];

    if (query.isNotEmpty) {
      Api api = Api();
      Future<List<Video>> result = api.pesquisar(query.toLowerCase());

      return FutureBuilder(
        future: result,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Container(
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.all(10)),
                    Text(
                      "Carregando...",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                )),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, indice) {
                    return ListTile(
                      title: Text(snapshot.data[indice].titulo),
                      onTap: () {
                        close(context, snapshot.data[indice].titulo);
                      },
                    );
                  },
                );
              }
              break;
          }
          return Container();
        },
      );
    } else {
      return Center(child: Text("Nenhum resultado para a pesquisa."));
    }
  }
}
