import 'package:flutter/material.dart';

class DropDownButtonFeedback extends StatefulWidget {
  List<String> opcoes;
  String opcao;
  double BORDER_RADIUS;
  EdgeInsetsGeometry PADDING_FORM;

  DropDownButtonFeedback(
      this.PADDING_FORM, this.BORDER_RADIUS, this.opcao, this.opcoes,
      {Key key})
      : super(key: key);

  @override
  _DropDownButtonFeedbackState createState() => _DropDownButtonFeedbackState();
}

class _DropDownButtonFeedbackState extends State<DropDownButtonFeedback> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.PADDING_FORM,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.blueGrey, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(widget.BORDER_RADIUS)),
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          value: widget.opcao,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          onChanged: (value) {
            setState(() {
              widget.opcao = value;
            });
          },
          items: widget.opcoes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
