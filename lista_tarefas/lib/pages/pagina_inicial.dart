import 'package:flutter/material.dart';
import 'package:lista_tarefas/pages/widgets_inicio/dialog_tarefa.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  List _tarefas = [];
  bool _checkbox = false;

  _salvarArquivo(novaTarefa) async {
    //pegando o caminho do diretório
    final diretorio = await getApplicationDocumentsDirectory();
    //criando um novo arquivo do tipo json
    var arquivo = File('${diretorio.path}/dados.json');

    //criando o json aqui e passando o valor da tarefa
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = novaTarefa;
    tarefa["realizada"] = false;

    _tarefas.add(tarefa);

    //passando o array de objetos para o valor json
    String dados = json.encode(_tarefas);
    //escrevendo no arquivo dados.json o novo valor
    arquivo.writeAsString(dados);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, indice) {
                return CheckboxListTile(
                  title: Text(_tarefas[indice]["titulo"]),
                  secondary: Icon(Icons.keyboard_arrow_right),
                  selected: _tarefas[indice]["realizada"],
                  value: _checkbox,
                  onChanged: (value) {
                    setState(() {
                      _checkbox = value;
                    });
                  },
                );
              },
              separatorBuilder: (_, __) => Divider(),
              itemCount: _tarefas.length,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        //child: Icon(Icons.add),
        icon: Icon(Icons.add),
        label: Text('Adicionar'),
        // shape: BeveledRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        tooltip: "Adicionar nova tarefa",
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              TextEditingController _novaTarefa = TextEditingController();

              return AlertDialog(
                content: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Digite sua tarefa',
                  ),
                  controller: _novaTarefa,
                  onChanged: (text) {},
                ),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _salvarArquivo(_novaTarefa.text);
                      Navigator.pop(context);
                    },
                    child: Text('Salvar'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar'),
                  ),
                ],
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.add),
            // ),
          ],
        ),
      ),
    );
  }
}
