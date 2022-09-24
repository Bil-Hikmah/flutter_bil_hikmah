class GameItem {
  int id;
  String name;
  int currentLevel;
  int totalLevel;

  GameItem({
    required this.id,
    required this.name,
    required this.currentLevel,
    required this.totalLevel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'currentLevel': currentLevel,
      'totalLevel': totalLevel,
    };
  }
}

class GameItemDetail {
  int id;
  int idGameItem;
  int level;
  String answerKey;
  String questionData;

  GameItemDetail({
    required this.id,
    required this.idGameItem,
    required this.level,
    required this.answerKey,
    required this.questionData,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idGameItem': idGameItem,
      'level': level,
      'answerKey': answerKey,
      'questionData': questionData,
    };
  }
}
