import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtube_clone/models/video.dart';
import 'package:flutter/material.dart';

class BlocoVideo extends StatefulWidget {
  final String CHAVE_YOUTUBE;
  Video video;
  BlocoVideo(this.CHAVE_YOUTUBE, this.video, {Key key}) : super(key: key);

  @override
  _BlocoVideoState createState() => _BlocoVideoState();
}

class _BlocoVideoState extends State<BlocoVideo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          FlutterYoutube.playYoutubeVideoById(
            apiKey: widget.CHAVE_YOUTUBE,
            videoId: widget.video.id,
            autoPlay: true,
            fullScreen: true,
            appBarColor: Colors.white,
            backgroundColor: Colors.white,
          );
        },
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
      ),
    );
  }
}
