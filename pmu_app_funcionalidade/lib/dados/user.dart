class User {
  String name;
  String curso;
  String matricula;
  String urlFoto;

  String primeiroNome(String nomeCompleto) {
    return nomeCompleto.split(' ')[0];
  }

  User({
    this.name = "Mércia Damasceno",
    this.curso = "Odontologia",
    this.matricula = "1074805",
    this.urlFoto =
        "https://www.ceara.gov.br/wp-content/uploads/2021/12/WhatsApp-Image-2021-11-30-at-06.02.11.jpeg",
  });
}
