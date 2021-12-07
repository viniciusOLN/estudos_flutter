import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  const TelaServico({Key key}) : super(key: key);

  @override
  _TelaServicoState createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nossos Serviços"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Image.asset("images/detalhe_servico.png"),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Nossos Serviços",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Text("Consultoria"),
            ),
            Text("Preços"),
            Text("Acompanhamento de projetos"),
          ],
        ),
      ),
    );
  }
}
