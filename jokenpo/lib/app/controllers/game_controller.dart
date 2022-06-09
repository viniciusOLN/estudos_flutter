import 'dart:math';


class Gamecontroller {

  int userPoints = 0;
  int appPoints = 0;

  String appRound;
  List<String> images = [
    "papel",
    "pedra",
    "tesoura",
  ];

  String lastuserPlay = '';
  String lastappPlay = '';

  String generateAppPlay() {
    appRound = images[Random().nextInt(3)].toString();
    return appRound;
  }



  String checkHand(String userRound) {
    

    if (lastuserPlay == "pedra" && userRound == "pedra") {
        return "Não pode pedra 2x";
    }


    if ((userRound == "pedra" &&  appRound == "tesoura") ||
        (userRound == "tesoura" &&  appRound == "papel") ||
        (userRound == "papel" &&  appRound == "pedra")) {
      lastuserPlay = userRound;
      userPoints++;
      return "Você ganhou!";
    } else if ((userRound == "tesoura" && appRound == "pedra") ||
        (userRound == "papel" && appRound == "tesoura") ||
        (userRound == "pedra" && appRound == "papel")) {
      lastappPlay = appRound;
      appPoints++;
      return "O app venceu!";
    } else {
      lastuserPlay = userRound;
      return "Deu Empate!";
    }
  }
}
