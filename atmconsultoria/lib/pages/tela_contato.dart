import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  const TelaContato({Key key}) : super(key: key);

  @override
  _TelaContatoState createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Image.asset("images/detalhe_contato.png"),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Contatos",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Text("algumemailqualquer@gmail.com"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Text("Telefone: (88) 988074001"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Text("Celular: (88) 988074001"),
            ),
          ],
        ),
      ),
    );
  }
}
