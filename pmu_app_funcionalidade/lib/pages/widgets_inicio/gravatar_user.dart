import 'package:flutter/material.dart';

class gravatarUser extends StatefulWidget {
  String urlFoto;
  gravatarUser(this.urlFoto, {Key key}) : super(key: key);

  @override
  _gravatarUserState createState() => _gravatarUserState();
}

class _gravatarUserState extends State<gravatarUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: 95,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(728),
        child: Image.network(
          widget.urlFoto,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Transform.scale(
              scale: 0.5,
              child: const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
