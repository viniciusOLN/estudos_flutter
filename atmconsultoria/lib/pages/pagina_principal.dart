import 'package:flutter/material.dart';
import 'package:atmconsultoria/pages/tela_empresa.dart';
import 'package:atmconsultoria/pages/tela_servico.dart';
import 'package:atmconsultoria/pages/tela_cliente.dart';
import 'package:atmconsultoria/pages/tela_contato.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({Key key}) : super(key: key);

  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  void _redirecionarPagina(tipoPagina) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => tipoPagina,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ATM Consultoria"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child: Image.asset("images/menu_empresa.png"),
                    onTap: () {
                      TelaEmpresa tipoPagina = TelaEmpresa();
                      _redirecionarPagina(tipoPagina);
                    },
                  ),
                  GestureDetector(
                      child: Image.asset("images/menu_servico.png"),
                      onTap: () {
                        TelaServico tipoPagina = TelaServico();
                        _redirecionarPagina(tipoPagina);
                      }),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                      child: Image.asset("images/menu_cliente.png"),
                      onTap: () {
                        TelaCliente tipoPagina = TelaCliente();
                        _redirecionarPagina(tipoPagina);
                      }),
                  GestureDetector(
                      child: Image.asset("images/menu_contato.png"),
                      onTap: () {
                        TelaContato tipoPagina = TelaContato();
                        _redirecionarPagina(tipoPagina);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
