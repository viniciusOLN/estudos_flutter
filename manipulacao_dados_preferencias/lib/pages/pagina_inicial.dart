import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  void initState() {
    super.initState();
  }

  String _estado = "Nada salvo!";
  TextEditingController _controllerCampo = TextEditingController();
  void _salvar() async {
    String valorDigitado = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);

    final string = await prefs.getString('nome');

    print('valor salvo: $valorDigitado');
    setState(() {
      _estado = "Valor salvo!";
    });
  }

  void _recuperar() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _estado = prefs.getString('nome') ?? "Sem valor";
    });
  }

  void _remover() async {
    final pref = await SharedPreferences.getInstance();
    final string = await pref.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manipulação de dados'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text(
              _estado,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('Digite algo'),
              ),
              controller: _controllerCampo,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _salvar,
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _recuperar,
                  child: Text(
                    'Recuperar',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _remover,
                  child: Text(
                    'Remover',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
