import 'dart:convert';

class QuranItem {
  QuranItem({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  final int code;
  final String status;
  final String message;
  final List<QuranItemData> data;

  factory QuranItem.fromJson(String str) => QuranItem.fromMap(json.decode(str));

  factory QuranItem.fromMap(Map<String, dynamic> json) => QuranItem(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: List<QuranItemData>.from(
            json["data"].map((x) => QuranItemData.fromMap(x))),
      );
}

class QuranItemData {
  QuranItemData({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
  });

  final int number;
  final int sequence;
  final int numberOfVerses;
  final QuranNaming name;
  final Revelation revelation;
  final Tafsir tafsir;

  factory QuranItemData.fromJson(String str) =>
      QuranItemData.fromMap(json.decode(str));

  factory QuranItemData.fromMap(Map<String, dynamic> json) => QuranItemData(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: QuranNaming.fromMap(json["name"]),
        revelation: Revelation.fromMap(json["revelation"]),
        tafsir: Tafsir.fromMap(json["tafsir"]),
      );
}

class QuranNaming {
  QuranNaming({
    required this.short,
    required this.long,
    required this.transliteration,
    required this.translation,
  });

  final String short;
  final String long;
  final Translation transliteration;
  final Translation translation;

  factory QuranNaming.fromJson(String str) =>
      QuranNaming.fromMap(json.decode(str));

  factory QuranNaming.fromMap(Map<String, dynamic> json) => QuranNaming(
        short: json["short"],
        long: json["long"],
        transliteration: Translation.fromMap(json["transliteration"]),
        translation: Translation.fromMap(json["translation"]),
      );
}

class Translation {
  Translation({
    required this.en,
    required this.id,
  });

  final String en;
  final String id;

  factory Translation.fromJson(String str) =>
      Translation.fromMap(json.decode(str));

  factory Translation.fromMap(Map<String, dynamic> json) => Translation(
        en: json["en"],
        id: json["id"],
      );
}

class Revelation {
  Revelation({
    required this.arab,
    required this.en,
    required this.id,
  });

  final Arab arab;
  final En en;
  final Id id;

  factory Revelation.fromJson(String str) =>
      Revelation.fromMap(json.decode(str));

  factory Revelation.fromMap(Map<String, dynamic> json) => Revelation(
        arab: arabValues.map[json["arab"]] ?? Arab.makkiyah,
        en: enValues.map[json["en"]] ?? En.meccan,
        id: idValues.map[json["id"]] ?? Id.makkiyah,
      );
}

enum Arab { madaniyah, makkiyah }

final arabValues = EnumValues(
  {
    "مدينة": Arab.madaniyah,
    "مكة": Arab.makkiyah,
  },
  reverseMap: null,
);

extension $ArabExtension on Arab {
  String get name {
    switch (this) {
      case Arab.madaniyah:
        return 'مدينة';
      case Arab.makkiyah:
        return 'مكة';
    }
  }
}

enum En { meccan, median }

extension EnExtension on En {
  String get name {
    switch (this) {
      case En.meccan:
        return 'Meccan';
      case En.median:
        return 'Median';
      default:
        return '';
    }
  }
}

final enValues = EnumValues(
  {
    "Meccan": En.meccan,
    "Medinan": En.median,
  },
  reverseMap: null,
);

enum Id { makkiyah, madaniyyah }

extension IdExtension on Id {
  String get name {
    switch (this) {
      case Id.makkiyah:
        return 'Makkiyah';
      case Id.madaniyyah:
        return 'Madaniyyah';
      default:
        return '';
    }
  }
}

final idValues = EnumValues(
  {
    "Madaniyyah": Id.madaniyyah,
    "Makkiyyah": Id.makkiyah,
  },
  reverseMap: null,
);

class Tafsir {
  Tafsir({
    required this.id,
  });

  final String id;

  factory Tafsir.fromJson(String str) => Tafsir.fromMap(json.decode(str));

  factory Tafsir.fromMap(Map<String, dynamic> json) => Tafsir(
        id: json["id"],
      );
}

class EnumValues<T> {
  final Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map, {this.reverseMap});

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
