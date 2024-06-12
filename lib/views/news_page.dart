// lib/views/news_page.dart

import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/noticia.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
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
                    : null,
                title: Text(noticia.titulo),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(noticia.descricao),
                    Text('Fonte: ${noticia.fonte}'),
                    Text(
                        'Data: ${noticia.data.toLocal().toString().split(' ')[0]}'),
                    Row(
                      children: [
                        noticia.time.urlImagem != null
                            ? Image.network(noticia.time.urlImagem!,
                                width: 20, height: 20)
                            : const SizedBox.shrink(),
                        const SizedBox(width: 5),
                        Text(noticia.time.nome),
                      ],
                    ),
                  ],
                ),
                onTap: noticia.url != null
                    ? () => _abrirNoticia(noticia.url!)
                    : null,
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
