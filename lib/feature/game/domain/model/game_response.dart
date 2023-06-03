class Game {
  final String name;
  final String bannerURL;
  final List<GameQuestion> questions;

  Game({
    required this.name,
    required this.bannerURL,
    required this.questions,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      name: json['name'],
      bannerURL: json['banner_url'],
      questions: (json['question'] as List<dynamic>).map<GameQuestion>((e) {
        return GameQuestion.fromJson(e);
      }).toList(),
    );
  }
}

class GameQuestion {
  final String imageURL;
  final String key;

  GameQuestion({
    required this.imageURL,
    required this.key,
  });

  factory GameQuestion.fromJson(Map<String, dynamic> json) {
    return GameQuestion(
      imageURL: json['image_url'],
      key: json['key'],
    );
  }
}
