// lib/views/news_page.dart

import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/noticia.dart';
import 'package:url_launcher/url_launcher.dart';

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
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: InkWell(
                  onTap: noticia.url != null
                      ? () => _abrirNoticia(noticia.url!)
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (noticia.urlImagem != null)
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                noticia.urlImagem!,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        const SizedBox(height: 8),
                        Text(
                          noticia.titulo,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(noticia.descricao),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fonte: ${noticia.fonte}',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Text(
                              'Data: ${noticia.data.toLocal().toString().split(' ')[0]}',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            if (noticia.time.urlImagem != null)
                              Image.network(
                                noticia.time.urlImagem!,
                                width: 20,
                                height: 20,
                              ),
                            const SizedBox(width: 5),
                            Text(noticia.time.nome),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _abrirNoticia(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
