// lib/models/game.dart

class Game {
  final DateTime date;
  final String place;
  final int resultTeamOne;
  final int resultTeamTwo;
  final int gameStatusId;
  final Championship championship;
  final Team teamOne;
  final Team teamTwo;

  Game({
    required this.date,
    required this.place,
    required this.resultTeamOne,
    required this.resultTeamTwo,
    required this.gameStatusId,
    required this.championship,
    required this.teamOne,
    required this.teamTwo,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      date: DateTime.parse(json['date']),
      place: json['place'],
      resultTeamOne: json['resultTeamOne'],
      resultTeamTwo: json['resultTeamTwo'],
      gameStatusId: json['gameStatusId'],
      championship: Championship.fromJson(json['championship']),
      teamOne: Team.fromJson(json['teamOne']),
      teamTwo: Team.fromJson(json['teamTwo']),
    );
  }
}

class Championship {
  final String name;
  final String image;
  final int rounds;

  Championship({
    required this.name,
    required this.image,
    required this.rounds,
  });

  factory Championship.fromJson(Map<String, dynamic> json) {
    return Championship(
      name: json['name'],
      image: json['image'],
      rounds: json['rounds'],
    );
  }
}

class Team {
  final String name;
  final String image;

  Team({
    required this.name,
    required this.image,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json['name'],
      image: json['image'],
    );
  }
}
