import 'package:flutter/material.dart';

Widget a() {
  return Container(
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(32),
          child: TextField(
            //aqui configura o tipo de teclado
            keyboardType: TextInputType.number,
            //aqui configura a decoração do input
            decoration: InputDecoration(
              //aqui configura o nome que aparece no placeholder
              labelText: "Digite um valor",
            ),
            //define se ele ta habilitado ou não
            //enabled: true,
            //maximo de caracteres suportado
            //maxLength: 300,
            //não permite mais dados fora do limite estaelecido a cima
            //(nao mostra na tela o texto excedente)
            //maxLengthEnforcement: MaxLengthEnforcement.enforced,
            //usado normalmente em campo de senha pra ocultar ela com asterisco
            obscureText: false,
            onSubmitted: (String e) {},
            controller: _textEditingController,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Salvar'),
        ),
      ],
    ),
  );
}
