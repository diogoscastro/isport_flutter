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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Classificação'),
      ),
      body: Container(
        color: Colors.blueGrey[50], // Cor de fundo alterada
        child: ListView.builder(
          itemCount: standings.length,
          itemBuilder: (context, index) {
            final team = standings[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          team['team'] as String,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pontos: ${team['points']}',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vitórias: ${team['wins']}',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            Text(
                              'Derrotas: ${team['losses']}',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
