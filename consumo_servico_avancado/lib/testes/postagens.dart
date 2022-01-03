class Post {
  int _idPost;
  String _autor;
  String _titulo;
  String _sobrePostagem;
  String _conteudoPostagem;

  Post(this._autor, this._conteudoPostagem, this._sobrePostagem, this._titulo);

  int get idPost => this._idPost;

  String get autor => this._autor;

  set autor(String autor) {
    _autor = autor;
  }

  String get titulo => this._titulo;

  set titulo(String titulo) {
    _titulo = titulo;
  }

  String get sobre => this._sobrePostagem;

  set sobre(String sobre) {
    _sobrePostagem = sobre;
  }

  String get conteudo => this._conteudoPostagem;

  set conteudo(String conteudo) {
    _conteudoPostagem = conteudo;
  }

  Map<String, dynamic> toJson() {
    return {
      "idPost": this._idPost,
      "autor": this._autor,
      "titulo": this._titulo,
      "sobrePostagem": this._sobrePostagem,
      "conteudoPostagem": this._conteudoPostagem,
    };
  }

  void adicionarPostagem(Post item) {}
}
