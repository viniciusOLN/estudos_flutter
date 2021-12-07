import 'logica_jogo.dart';

class ControllerJogo extends LogicaJogo {
  String VerificarJogada(String jogadaUser) {
    if ((jogadaUser == "pedra" && this.jogadaApp == "tesoura") ||
        (jogadaUser == "tesoura" && this.jogadaApp == "papel") ||
        (jogadaUser == "papel" && this.jogadaApp == "pedra")) {
      return "Você ganhou!";
    } else if ((jogadaUser == "tesoura" && this.jogadaApp == "pedra") ||
        (jogadaUser == "papel" && this.jogadaApp == "tesoura") ||
        (jogadaUser == "pedra" && this.jogadaApp == "papel")) {
      return "O app venceu!";
    } else {
      return "Deu Empate!";
    }
  }
}
