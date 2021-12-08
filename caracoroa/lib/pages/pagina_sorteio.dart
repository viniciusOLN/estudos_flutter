import 'package:flutter/material.dart';

class PaginaSorteio extends StatefulWidget {
  int caraOuCoroa;
  PaginaSorteio(this.caraOuCoroa, {Key key}) : super(key: key);

  @override
  _PaginaSorteioState createState() => _PaginaSorteioState();
}

class _PaginaSorteioState extends State<PaginaSorteio> {
  List<String> _caraCoroa = [
    "moeda_cara.png",
    "moeda_coroa.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfff61bd86),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/${_caraCoroa[widget.caraOuCoroa]}"),
            Padding(padding: EdgeInsets.all(10)),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("images/botao_voltar.png"),
            ),
          ],
        ),
      ),
    );
  }
}
