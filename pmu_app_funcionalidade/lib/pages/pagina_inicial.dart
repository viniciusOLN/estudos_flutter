import 'package:flutter/material.dart';
import 'package:pmu_app_funcionalidade/dados/user.dart';
import 'widgets_inicio/container_branco.dart';
import 'widgets_inicio/gravatar_user.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  User usuario = User();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
          color: const Color.fromRGBO(24, 71, 132, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ContainerBranco(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    gravatarUser(usuario.urlFoto),
                    const Padding(
                        padding: EdgeInsets.only(left: 14, right: 14)),
                    Column(
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
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 25),
                child: Text(
                  'Ações Principais',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: const Color.fromRGBO(50, 50, 50, 1),
          backgroundColor: Colors.white,
          child: const Icon(Icons.privacy_tip),
          onPressed: () {
            print('pressionei o botão de relatório de feedback');
          },
        ),
      ),
    );
  }
}
