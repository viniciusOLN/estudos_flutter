import 'package:clone_youtube/api/api.dart';
import 'package:clone_youtube/models/video.dart';
import 'package:clone_youtube/pages/widgets_inicio/bloco_video.dart';
import 'package:clone_youtube/pages/widgets_inicio/bloco_video.dart';
import 'package:clone_youtube/pages/widgets_inicio/bloco_video.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    Api api = Api();
    _listarVideos() {
      Api api = Api();
      return api.pesquisar("");
    }

    return Container(
      child: FutureBuilder<List<Video>>(
        future: api.pesquisar(""),
        builder: (context, snapshoot) {
          switch (snapshoot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Container(
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.all(10)),
                    Text(
                      "Carregando...",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                )),
              );

              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshoot.hasData) {
                if (!snapshoot.hasError) {
                  return ListView.separated(
                    separatorBuilder: (context, builder) => Divider(
                      height: 3,
                      color: Colors.grey,
                    ),
                    itemCount: snapshoot.data.length,
                    itemBuilder: (context, indice) {
                      return BlocoVideo(snapshoot.data[indice]);
                    },
                  );
                }
              } else {
                return Container(
                  child: Center(
                    child: Text(
                        "Erro no acesso aos vídeos! Tente novamente mais tarde"),
                  ),
                );
              }
              break;
          }
          return Container();
        },
      ),
    );
  }
}