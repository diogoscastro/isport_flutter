class Noticia {
  final String titulo;
  final String descricao;
  final String? urlImagem;
  final DateTime data;
  final String fonte;
  final String timeId;
  final Time time;
  final String? url; // Adicionado o campo url

  Noticia({
    required this.titulo,
    required this.descricao,
    this.urlImagem,
    required this.data,
    required this.fonte,
    required this.timeId,
    required this.time,
    this.url, // Adicionado no construtor
  });

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      titulo: json['title'],
      descricao: json['description'],
      urlImagem: json['image'],
      data: DateTime.parse(json['date']),
      fonte: json['source'],
      timeId: json['teamId'],
      time: Time.fromJson(json['team']),
      url: json['url'], // Adicionado na fábrica
    );
  }
}

class Time {
  final String nome;
  final String? urlImagem;

  Time({
    required this.nome,
    this.urlImagem,
  });

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      nome: json['name'],
      urlImagem: json['image'],
    );
  }
}
