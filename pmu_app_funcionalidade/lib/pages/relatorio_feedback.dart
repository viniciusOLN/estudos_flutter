import 'package:flutter/material.dart';

Future relatorioFeedback(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text('Relatório feedback'),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      'Encontrou algum erro no aplicativo ou tem algum comentário sobre ele? Nos informe através do questionário abaixo.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(64, 64, 64, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color.fromRGBO(64, 64, 64, 1),
        ),
        content: Container(
          child: Text('oi'),
        ),
        actions: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_right,
              ),
              label: const Text(
                "Enviar Relatório",
                style: TextStyle(fontSize: 18),
              ),
              //.........
            ),
          ),
        ],
      );
    },
  );
}
