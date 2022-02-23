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

  Future<File> _getFile() async {
    //pegando o caminho do diretório
    final diretorio = await getApplicationDocumentsDirectory();
    //criando um novo arquivo do tipo json
    var arquivo = File('${diretorio.path}/dados.json');
    return arquivo;
  }

  _salvarTarefa(novaTarefa) {
    //criando o json aqui e passando o valor da tarefa
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = novaTarefa["titulo"];
    tarefa["realizada"] = novaTarefa["realizada"];

    setState(() {
      _tarefas.add(tarefa);
    });
    _salvarArquivo();
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();
    //passando o array de objetos para o valor json
    String dados = json.encode(_tarefas);
    //escrevendo no arquivo dados.json o novo valor
    arquivo.writeAsString(dados);
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _lerArquivo().then((data) {
      setState(() {
        _tarefas = json.decode(data);
      });
    });
  }

  Widget _criarItemLista(context, indice) {
    final item = _tarefas[indice];

    return Dismissible(
      key: Key(item['titulo']),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          _tarefas.removeAt(indice);
          _salvarArquivo();
        }
      },
      background: Container(
        color: Colors.green,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ],
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
      child: CheckboxListTile(
        title: Text(_tarefas[indice]["titulo"]),
        secondary: Icon(Icons.keyboard_arrow_right),
        selected: _tarefas[indice]["realizada"],
        value: _tarefas[indice]["realizada"],
        onChanged: (value) {
          setState(() {
            _tarefas[indice]["realizada"] = value;
            _salvarArquivo();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('itens: ' + _tarefas.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _tarefas.isEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: const Text(
                            'Nenhuma tarefa adicionada.',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18,
                            ),
                          )),
                    ],
                  )
                : ListView.builder(
                    itemCount: _tarefas.length,
                    itemBuilder: _criarItemLista,
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
                      Map<String, dynamic> novaTarefaMap = {
                        "titulo": _novaTarefa.text,
                        "realizada": false
                      };
                      _salvarTarefa(novaTarefaMap);
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
