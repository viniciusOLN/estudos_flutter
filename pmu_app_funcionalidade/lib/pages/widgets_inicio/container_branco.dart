import 'package:flutter/material.dart';

class ContainerBranco extends StatefulWidget {
  Widget childWidget;
  ContainerBranco(this.childWidget, {Key key}) : super(key: key);

  @override
  _ContainerBrancoState createState() => _ContainerBrancoState();
}

class _ContainerBrancoState extends State<ContainerBranco> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Colors.white,
      ),
      child: widget.childWidget,
    );
  }
}
