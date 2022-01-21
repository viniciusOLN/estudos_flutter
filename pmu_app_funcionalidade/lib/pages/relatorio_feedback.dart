import 'package:flutter/material.dart';

String tipoFeedbackValue = 'Selecione o tipo de feedback';
String localFeedbackValue = 'Selecione o local do feedback';

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
                        fontSize: 12,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Tipo de feedback'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blueGrey,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8)),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  value: tipoFeedbackValue,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  onChanged: (value) {},
                  items: <String>[
                    'Selecione o tipo de feedback',
                    'Conexão',
                    'Design',
                    'Usabilidade',
                    'Dados errados',
                    'Outro'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Text('Local do feedback'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blueGrey,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8)),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  value: localFeedbackValue,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  onChanged: (value) {},
                  items: <String>[
                    'Selecione o local do feedback',
                    'Conexão',
                    'Design',
                    'Usabilidade',
                    'Dados errados',
                    'Outro'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Text('Descrição do feedback'),
              TextField(),
            ],
          ),
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
