import 'package:flutter/material.dart';
import 'dart:async';

class PopupNotificacaoValida extends StatefulWidget {
  String titulo;
  BuildContext context;
  PopupNotificacaoValida(this.context, this.titulo, {Key key})
      : super(key: key);

  @override
  _PopupNotificacaoValidaState createState() => _PopupNotificacaoValidaState();
}

class _PopupNotificacaoValidaState extends State<PopupNotificacaoValida> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pop(widget.context);
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            height: 100,
            width: MediaQuery.of(context).size.width / 1.6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        widget.titulo,
                        style: TextStyle(
                          color: Color.fromRGBO(88, 88, 88, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.titulo,
                        style: TextStyle(
                          color: Color.fromRGBO(102, 98, 98, 1),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PopupNotificacaoFormularioInvalida extends StatelessWidget {
  String titulo;
  BuildContext contextH;
  PopupNotificacaoFormularioInvalida(this.titulo, this.contextH, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pop(contextH);
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 45,
                ),
                Expanded(
                  child: Text(
                    titulo,
                    style: TextStyle(
                      color: Color.fromRGBO(204, 53, 58, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
