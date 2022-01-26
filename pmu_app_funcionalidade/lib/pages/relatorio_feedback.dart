import 'package:flutter/material.dart';
import 'package:pmu_app_funcionalidade/pages/widgets_inicio/container_branco.dart';
import 'package:pmu_app_funcionalidade/pages/widgets_relatorio_feedback/botao_formatado.dart';
import 'package:pmu_app_funcionalidade/pages/widgets_relatorio_feedback/campo_texto_feedback.dart';
import 'package:pmu_app_funcionalidade/pages/widgets_relatorio_feedback/dropdownbutton_feedback.dart';
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

const double BORDER_RADIUS = 2;
const EdgeInsetsGeometry PADDING_FORM = EdgeInsets.only(bottom: 10);

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
        content: Form(
          child: Container(
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextoFormatado('Tipo de feedback'),
                DropDownButtonFeedback(
                  PADDING_FORM,
                  BORDER_RADIUS,
                  tipoFeedbackValue,
                  tipoFeedbackDrop,
                ),
                TextoFormatado('Local do feedback'),
                DropDownButtonFeedback(
                  PADDING_FORM,
                  BORDER_RADIUS,
                  localFeedbackValue,
                  localFeedbackDrop,
                ),
                TextoFormatado('Descrição do feedback'),
                CampoTextoFeedback(BORDER_RADIUS, textoFeedback),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          BotaoFormatado(() {
            print(localFeedbackValue);
            print(tipoFeedbackValue);
            print(textoFeedback.text);
          }),
        ],
      );
    },
  );
}
