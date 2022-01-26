import 'package:flutter/material.dart';

class CampoTextoFeedback extends StatefulWidget {
  TextEditingController _controller = TextEditingController();
  final double _BORDER_RADIUS;
  CampoTextoFeedback(this._BORDER_RADIUS, this._controller, {Key key})
      : super(key: key);

  @override
  _CampoTextoFeedbackState createState() => _CampoTextoFeedbackState();
}

class _CampoTextoFeedbackState extends State<CampoTextoFeedback> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._controller,
      maxLines: 4,
      decoration: InputDecoration(
        hintText: 'Descreva o erro/melhoria ou comentário sobre o aplicativo.',
        contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 6),
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(widget._BORDER_RADIUS))),
      ),
    );
  }
}
