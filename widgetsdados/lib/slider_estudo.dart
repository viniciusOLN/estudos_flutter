import 'package:flutter/material.dart';

class SliderEstudo extends StatefulWidget {
  @override
  _SliderEstudoState createState() => _SliderEstudoState();
}

class _SliderEstudoState extends State<SliderEstudo> {
  double _valor, _numero = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(_numero.round().toString()),
            Slider(
              value: _valor,
              min: 0,
              max: 10,
              // mostra uma label durante o slider
              label: _numero.toString(),
              // usado junto com o slider, so funciona se ele tiver junto
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  _valor = value;
                  _numero = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
