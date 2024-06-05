import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/noticia.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key); // Construtor com Key

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();
  late Future<List<Noticia>> _noticiasFuture;

  @override
  void initState() {
    super.initState();
    _noticiasFuture = _apiService.fetchNoticias('futebol');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notícias de Futebol'),
      ),
      body: FutureBuilder<List<Noticia>>(
        future: _noticiasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhuma notícia encontrada'));
          }

          final noticias = snapshot.data!;
          return ListView.builder(
            itemCount: noticias.length,
            itemBuilder: (context, index) {
              final noticia = noticias[index];
              return ListTile(
                leading: noticia.urlImagem != null
                    ? Image.network(noticia.urlImagem!)
                    : null, // Permitir nulo
                title: Text(noticia.titulo),
                subtitle: Text(noticia.descricao),
                onTap: () {
                  _abrirNoticia(noticia.url);
                },
              );
            },
          );
        },
      ),
    );
  }

  void _abrirNoticia(String url) {
    // Você pode usar o url_launcher para abrir a URL no navegador
    // https://pub.dev/packages/url_launcher
  }
}