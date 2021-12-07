import 'package:flutter/material.dart';

class RadioButtons extends StatefulWidget {
  @override
  _RadioButtonsState createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  String _escolhaUsuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Buttons'),
      ),
      body: Container(
        child: Column(
          children: [
            // Text("Masculino"),
            // Radio(
            //   value: "M",
            //   activeColor: Colors.red,
            //   groupValue: _escolhaUsuario,
            //   onChanged: (valor) {
            //     print("m");
            //     setState(() {
            //       _escolhaUsuario = valor;
            //     });
            //   },
            // ),
            // Text("Feminino"),
            // Radio(
            //   value: "M",
            //   groupValue: _escolhaUsuario,
            //   onChanged: (valor) {
            //     print("f");
            //     setState(() {
            //       _escolhaUsuario = valor;
            //     });
            //   },
            // ),
            RadioListTile(
                value: 'm',
                title: Text('Masculino'),
                groupValue: _escolhaUsuario,
                onChanged: (value) {
                  setState(() {
                    _escolhaUsuario = value;
                  });
                }),
            RadioListTile(
                value: 'f',
                title: Text('Feminino'),
                groupValue: _escolhaUsuario,
                onChanged: (value) {
                  setState(() {
                    _escolhaUsuario = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
