import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/noticia.dart';
import '../models/game.dart';

class ApiService {
  final String apiUrlNews = 'https://localhost:7135/api/News';
  final String apiUrlGames = 'https://localhost:7135/api/Games';

  Future<List<Noticia>> fetchNoticias(String categoria) async {
    final response = await http.get(Uri.parse('$apiUrlNews'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => Noticia.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar as notícias');
    }
  }

  Future<List<Game>> fetchGames() async {
    final response = await http.get(Uri.parse(apiUrlGames));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => Game.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar os jogos');
    }
  }
}
