// lib/views/standings_page.dart

import 'package:flutter/material.dart';

class StandingsPage extends StatelessWidget {
  const StandingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dados fictícios
    final standings = [
      {'team': 'Team A', 'points': 40, 'wins': 12, 'losses': 3},
      {'team': 'Team B', 'points': 38, 'wins': 11, 'losses': 4},
      {'team': 'Team C', 'points': 35, 'wins': 10, 'losses': 5},
      // Adicione mais times conforme necessário
    ];

    return ListView.builder(
      itemCount: standings.length,
      itemBuilder: (context, index) {
        final team = standings[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text('${index + 1}'),
          ),
          title: Text(team['team'] as String),
          subtitle: Row(
            children: [
              Expanded(
                child: Text('Pontos: ${team['points']}'),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text('Vitórias: ${team['wins']}'),
                    Text('Derrotas: ${team['losses']}'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
