// lib/views/player_profile_page.dart

import 'package:flutter/material.dart';

class PlayerProfilePage extends StatelessWidget {
  final String playerName;
  final String playerImage;
  final String playerBio;
  final Map<String, dynamic> playerStats;

  const PlayerProfilePage({
    Key? key,
    required this.playerName,
    required this.playerImage,
    required this.playerBio,
    required this.playerStats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Jogador'),
      ),
      body: Container(
        color: Colors.blueGrey[50],
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(playerImage),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  playerName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bio:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(playerBio),
                    ],
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Estatísticas:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...playerStats.entries.map(
                        (entry) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text('${entry.key}: ${entry.value}'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
