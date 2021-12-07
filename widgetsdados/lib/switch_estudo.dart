import 'package:flutter/material.dart';

class Switch_estudo extends StatefulWidget {
  @override
  _Switch_estudoState createState() => _Switch_estudoState();
}

class _Switch_estudoState extends State<Switch_estudo> {
  bool _aceitarNotificacoes = false;
  bool _aceitarNotificacoes2 = false;
  String _textoNotificacoes = "Não";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(_textoNotificacoes),
            Switch(
              value: _aceitarNotificacoes,
              onChanged: (value) {
                if (value) {
                  setState(() {
                    _aceitarNotificacoes = value;
                    _textoNotificacoes = "Sim";
                  });
                } else {
                  setState(() {
                    _aceitarNotificacoes = value;
                    _textoNotificacoes = 'Não';
                  });
                }
              },
            ),
            Text("Deseja receber notificações?"),
            SwitchListTile(
              title: Text("Aceitar Notificações?"),
              value: _aceitarNotificacoes2,
              onChanged: (value) {
                setState(() {
                  _aceitarNotificacoes2 = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
