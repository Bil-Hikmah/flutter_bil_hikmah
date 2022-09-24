class GameData {
  final int id;
  final int level;
  final String answerKey;
  final String questionData;

  GameData({
    required this.id,
    required this.level,
    required this.answerKey,
    required this.questionData,
  });
}

final List<GameData> listGameDetailHitung = [
  GameData(
    id: 1,
    level: 0,
    answerKey: "3",
    questionData:
        "https://res.cloudinary.com/spiralyze/image/upload/f_auto/BabySignLanguage/DictionaryPages/again-preview-png.png",
  ),
  GameData(
    id: 2,
    level: 1,
    answerKey: "3",
    questionData:
        "https://res.cloudinary.com/spiralyze/image/upload/f_auto/BabySignLanguage/DictionaryPages/again-preview-png.png",
  ),
  GameData(
    id: 3,
    level: 2,
    answerKey: "3",
    questionData:
        "https://res.cloudinary.com/spiralyze/image/upload/f_auto/BabySignLanguage/DictionaryPages/again-preview-png.png",
  )
];

final List<GameData> listGameDetailAngka = [
  GameData(
    id: 4,
    level: 0,
    answerKey: "3",
    questionData:
        "https://res.cloudinary.com/spiralyze/image/upload/f_auto/BabySignLanguage/DictionaryPages/again-preview-png.png",
  ),
  GameData(
    id: 5,
    level: 1,
    answerKey: "3",
    questionData:
        "https://res.cloudinary.com/spiralyze/image/upload/f_auto/BabySignLanguage/DictionaryPages/again-preview-png.png",
  ),
];
