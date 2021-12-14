import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  List _itens = [];
  void _carregarItens() {
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item["titulo"] = "Título ${i}";
      item["descricao"] = "descricao ${i}";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();
    return Scaffold(
      appBar: AppBar(
        title: Text("listas"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, indice) {
            return ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // titulo do conteudo
                      title: Text(_itens[indice]["titulo"]),
                      // conteudo
                      content: Text(_itens[indice]["descricao"]),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            print("clicou no sim");
                            Navigator.pop(context);
                          },
                          child: Text("sim"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print("clicou no não");
                            Navigator.pop(context);
                          },
                          child: Text("não"),
                        ),
                      ],
                      // padding do titulo
                      titlePadding: EdgeInsets.all(20),
                      // padding do conteudo
                      contentPadding: EdgeInsets.all(50),
                      // estilo do titulo
                      titleTextStyle: TextStyle(
                        color: Colors.blue,
                      ),
                      // backgroundColor: Colors.yellow,
                    );
                  },
                );
              },
              onLongPress: () {
                print("long press aqui");
              },
              title: Text(_itens[indice]["titulo"]),
              subtitle: Text(_itens[indice]["descricao"]),
            );
          },
        ),
      ),
    );
  }
}
