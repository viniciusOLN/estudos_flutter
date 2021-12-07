import 'dart:math';
import 'classe_anemica.dart';

class LogicaJogo extends AnemicaLogicaJogo {
  String gerarJogadaApp() {
    this.jogadaApp = imagens[Random().nextInt(3)].toString();
    return jogadaApp;
  }
}
