import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/noticia.dart';

class ApiService {
  static const String _apiKey = 'SUA_CHAVE_API';
  static const String _baseUrl = 'https://newsapi.org/v2';

  Future<List<Noticia>> fetchNoticias(String team) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/everything?q=$team&apiKey=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> noticiasJson = json.decode(response.body)['articles'];
      return noticiasJson.map((json) => Noticia.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar notícias');
    }
  }
}
