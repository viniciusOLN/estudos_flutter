import 'package:flutter/material.dart';
import 'tela_secundaria.dart';

class Navegacao extends StatefulWidget {
  @override
  _NavegacaoState createState() => _NavegacaoState();
}

class _NavegacaoState extends State<Navegacao> {
  String _texto = "Esse é um texto passado pela primeira tela";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Troca de tela"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                child:
                    Text("Ir para outra tela", style: TextStyle(fontSize: 22)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TelaSecundaria(_texto)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
