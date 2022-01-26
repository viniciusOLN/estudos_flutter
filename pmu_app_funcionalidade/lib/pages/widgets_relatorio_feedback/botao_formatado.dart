import 'package:flutter/material.dart';

class BotaoFormatado extends StatelessWidget {
  Function onTap;
  BotaoFormatado(this.onTap, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: const Icon(
          Icons.keyboard_arrow_right,
        ),
        label: const Text(
          "Enviar Relatório",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        //.........
      ),
    );
  }
}
