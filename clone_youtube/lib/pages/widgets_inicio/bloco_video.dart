import 'package:clone_youtube/models/video.dart';
import 'package:flutter/material.dart';

class BlocoVideo extends StatefulWidget {
  Video video;
  BlocoVideo(this.video, {Key key}) : super(key: key);

  @override
  _BlocoVideoState createState() => _BlocoVideoState();
}

class _BlocoVideoState extends State<BlocoVideo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.video.imagem),
              ),
            ),
          ),
          ListTile(
            title: Text(widget.video.titulo),
          ),
        ],
      ),
    );
  }
}
