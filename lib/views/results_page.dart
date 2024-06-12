// lib/views/results_page.dart

import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/game.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  ResultsPageState createState() => ResultsPageState();
}

class ResultsPageState extends State<ResultsPage> {
  final ApiService _apiService = ApiService();
  late Future<List<Game>> _gamesFuture;

  @override
  void initState() {
    super.initState();
    _gamesFuture = _apiService.fetchGames();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Game>>(
      future: _gamesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum resultado encontrado'));
        }

        final games = snapshot.data!;
        return ListView.builder(
          itemCount: games.length,
          itemBuilder: (context, index) {
            final game = games[index];
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(game.teamOne.image, width: 20, height: 20),
                  const SizedBox(width: 8),
                  Text('${game.teamOne.name} vs ${game.teamTwo.name}'),
                  const SizedBox(width: 8),
                  Image.network(game.teamTwo.image, width: 20, height: 20),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Data: ${game.date.toLocal().toString().split(' ')[0]}'),
                  Text('Local: ${game.place}'),
                  Text(
                      'Resultado: ${game.resultTeamOne} - ${game.resultTeamTwo}'),
                  Text('Campeonato: ${game.championship.name}'),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
