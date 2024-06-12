// lib/main.dart

import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'views/results_page.dart';
import 'views/standings_page.dart';
import 'views/player_profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notícias de Futebol',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Defina a cor dos ícones não selecionados na barra de navegação inferior
        // e o tamanho dos ícones não selecionados
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey, // Cor dos ícones não selecionados
          unselectedIconTheme:
              IconThemeData(size: 24), // Tamanho dos ícones não selecionados
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ResultsPage(),
    StandingsPage(),
    PlayerProfilePage(
      playerName: 'Cristiano Ronaldo',
      playerImage:
          'https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg',
      playerBio:
          'Cristiano Ronaldo é um jogador de futebol português que atua como atacante. Atualmente joga pelo Al Nassr.',
      playerStats: {'Gols': 780, 'Assistências': 220, 'Partidas': 1000},
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Notícias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Resultados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Classificação',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Jogador',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
