import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  String _imagemDoMomento = "padrao";
  String _mensagem = "Escolha uma opção abaixo!";
  Gamecontroller controller = Gamecontroller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokenpo'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'PONTUAÇÃO: USUARIO: ${controller.userPoints} | APP: ${controller.appPoints}',
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text('Escolha do App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Image.asset(
            "images/$_imagemDoMomento.png",
            height: 95,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(_mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.userPoints;
                      controller.appPoints;
                      _imagemDoMomento = controller.generateAppPlay();
                      _mensagem = controller.checkHand("pedra");
                    });
                  },
                  child: Image.asset(
                    "images/pedra.png",
                    height: 95,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.userPoints;
                      controller.appPoints;
                      _imagemDoMomento = controller.generateAppPlay();
                      _mensagem = controller.checkHand("papel");
                    });
                  },
                  child: Image.asset(
                    "images/papel.png",
                    height: 95,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.userPoints;
                      controller.appPoints;
                      _imagemDoMomento = controller.generateAppPlay();
                      _mensagem = controller.checkHand("tesoura");
                    });
                  },
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 95,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _imagemDoMomento = 'padrao';
                    controller.userPoints = 0;
                    controller.appPoints = 0;
                    _mensagem = '';
                  });
                },
                child: Text('REINICIAR')),
          ),
          Text(
              'Alunos: Victor Cavalcante Vieira, João Vitor, Vinicius Oliveira')
        ],
      ),
    );
  }
}
