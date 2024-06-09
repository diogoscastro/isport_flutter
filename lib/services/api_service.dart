import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/noticia.dart';

class ApiService {
  final String apiUrl = 'https://localhost:7135/api/News';

  Future<List<Noticia>> fetchNoticias(String categoria) async {
    final response = await http.get(Uri.parse('$apiUrl?categoria=$categoria'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => Noticia.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar as notícias');
    }
  }
}
