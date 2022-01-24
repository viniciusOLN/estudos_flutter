import 'package:flutter/material.dart';
import 'package:pmu_app_funcionalidade/pages/widgets_relatorio_feedback/botao_formatado.dart';
import 'package:pmu_app_funcionalidade/pages/widgets_relatorio_feedback/titulo_input.dart';

List<String> tipoFeedbackDrop = [
  'Selecione o tipo de feedback',
  'Conexão',
  'Design',
  'Usabilidade',
  'Dados errados',
  'Outro',
];

List<String> localFeedbackDrop = [
  'Selecione o local do feedback',
  'Conexão',
  'Design',
  'Usabilidade',
  'Dados errados',
  'Outro',
];

final double BORDER_RADIUS = 2;
final EdgeInsetsGeometry PADDING_FORM = EdgeInsets.only(bottom: 10);

String tipoFeedbackValue = 'Selecione o tipo de feedback';
String localFeedbackValue = 'Selecione o local do feedback';
TextEditingController textoFeedback = TextEditingController();

Future relatorioFeedback(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actionsPadding: EdgeInsets.symmetric(horizontal: 12),
        titlePadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Relatório feedback',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      'Encontrou algum erro no aplicativo ou tem algum comentário sobre ele? Nos informe através do questionário abaixo.',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(64, 64, 64, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: const Icon(Icons.close),
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
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextoFormatado('Tipo de feedback'),
              Padding(
                padding: PADDING_FORM,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blueGrey,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(BORDER_RADIUS)),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    value: tipoFeedbackValue,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    onChanged: (value) {},
                    items: tipoFeedbackDrop
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              TextoFormatado('Local do feedback'),
              Padding(
                padding: PADDING_FORM,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blueGrey,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(BORDER_RADIUS)),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    value: localFeedbackValue,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    onChanged: (value) {},
                    items: localFeedbackDrop
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              TextoFormatado('Descrição do feedback'),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText:
                      'Descreva o erro/melhoria ou comentário sobre o aplicativo.',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(BORDER_RADIUS))),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          BotaoFormatado(),
        ],
      );
    },
  );
}
