import 'package:flutter/material.dart';
import 'package:pmu_app_funcionalidade/pages/widgets_inicio/container_branco.dart';

class ItemPrincipal extends StatelessWidget {
  String titulo;
  Icon icon;
  Function ontap;
  ItemPrincipal(this.ontap, this.titulo, this.icon, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: ContainerBranco(
        ListTile(
          title: Text(
            titulo,
            style: const TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(64, 64, 64, 1),
            ),
          ),
          leading: icon,
          onTap: ontap,
        ),
      ),
    );
  }
}
