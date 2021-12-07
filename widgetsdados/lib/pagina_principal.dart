import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  bool _comidaBrasileira = false;
  bool _comidaMexicana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Testando Componentes de entrada de dados",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // Checkbox(
            //   value: _estaSelecionado,
            //   onChanged: (valor) {
            //     setState(() {
            //       _estaSelecionado = valor;
            //     });
            //   },
            // ),
            //maneira de criar um checkbox
            CheckboxListTile(
              //titulo do checkbox
              title: Text("Comida Brasileira"),
              //subtitulo do checkbox
              subtitle: Text("A melhor comida do mundo!"),
              //cor do checkbox quando selecionado
              // o texto do chekcbox fica com a cor do activecolors ali em cima
              selected: _comidaBrasileira,
              //icone
              secondary: Icon(Icons.add_box),
              value: _comidaBrasileira,
              onChanged: (valor) {
                setState(() {
                  _comidaBrasileira = valor;
                });
              },
            ),
            CheckboxListTile(
              //titulo do checkbox
              title: Text("Comida Mexicana"),
              //subtitulo do checkbox
              subtitle: Text("A melhor comida do mundo!"),
              //cor do checkbox quando selecionado
              // o texto do chekcbox fica com a cor do activecolors ali em cima
              selected: _comidaMexicana,
              //icone
              secondary: Icon(Icons.add_box),
              value: _comidaMexicana,
              onChanged: (valor) {
                setState(() {
                  _comidaMexicana = valor;
                });
              },
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Text("Salvar",
                                    style: TextStyle(
                                      fontSize: 20,
                                    )),
                              ),
                              onPressed: () {
                                print(
                                    "brasileira: ${_comidaBrasileira}, mexicana: ${_comidaMexicana}");
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
