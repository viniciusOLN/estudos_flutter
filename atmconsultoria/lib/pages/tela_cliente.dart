import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  const TelaCliente({Key key}) : super(key: key);

  @override
  _TelaClienteState createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Image.asset("images/detalhe_cliente.png"),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Clientes",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Image.asset("images/cliente1.png"),
            ),
            Text("Empresa de software"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Image.asset("images/cliente2.png"),
            ),
            Text("Empresa de auditoria"),
          ],
        ),
      ),
    );
  }
}
