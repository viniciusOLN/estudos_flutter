import 'package:flutter/material.dart';
import 'package:pmu_app_funcionalidade/dados/user.dart';

class InfosUser extends StatelessWidget {
  User usuario = User();
  InfosUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            const Text(
              'Bem-vindo(a), ',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(usuario.nomeCompleto(usuario.name) + '!'),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(4),
        ),
        Row(
          children: <Widget>[
            const Text(
              'Curso: ',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(usuario.curso),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(4),
        ),
        Row(
          children: <Widget>[
            const Text(
              'Matrícula: ',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(usuario.matricula),
          ],
        ),
      ],
    );
  }
}
