import 'package:flutter/material.dart';
import 'package:pmu_app_funcionalidade/pages/widgets_inicio/item_principal.dart';

class OpcoesPrincipais extends StatelessWidget {
  const OpcoesPrincipais({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemPrincipal(
          () {
            print('oi');
          },
          'Identificação do Usuário',
          const Icon(Icons.sentiment_satisfied_alt),
        ),
        ItemPrincipal(
          () {
            print('oi');
          },
          'Histórico Acadêmico',
          const Icon(Icons.book),
        ),
        ItemPrincipal(
          () {},
          'Comprovante de Matrícula',
          const Icon(Icons.account_box_rounded),
        ),
        ItemPrincipal(
          () {
            print('oi');
          },
          'Declaração de Vínculo',
          const Icon(Icons.bookmark),
        ),
      ],
    );
  }
}
