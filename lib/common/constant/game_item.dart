class GameItem {
  int id;
  String name;
  int currentLevel;

  GameItem({required this.id, required this.name, required this.currentLevel});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'currentLevel': currentLevel,
    };
  }
}
