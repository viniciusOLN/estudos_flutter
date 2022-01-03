import 'package:clone_youtube/api/credenciais_api.dart';
import 'package:clone_youtube/models/video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api extends credenciais_api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    List<Video> videos;
    http.Response response = await http.get(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=10"
            "&order=date"
            "&key=${CHAVE_YOUTUBE}"
            "&q=${pesquisa}"
            "&regionCode=BR");
    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      videos = dadosJson['items'].map<Video>((video) {
        return Video.fromJson(video);
      }).toList();
    } else {
      print(response.statusCode);
      print(response.body);
    }
    return videos;
  }
}
