import 'dart:convert';

class SurahItem {
  SurahItem({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  final int code;
  final String status;
  final String message;
  final SurahItemData data;

  factory SurahItem.fromJson(String str) => SurahItem.fromMap(json.decode(str));

  factory SurahItem.fromMap(Map<String, dynamic> json) => SurahItem(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: SurahItemData.fromMap(json["data"]),
      );
}

class SurahItemData {
  SurahItemData({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
    required this.preBismillah,
    required this.verses,
  });

  final int number;
  final int sequence;
  final int numberOfVerses;
  final Name name;
  final Revelation revelation;
  final DataTafsir tafsir;
  final dynamic preBismillah;
  final List<Verse> verses;

  factory SurahItemData.fromJson(String str) =>
      SurahItemData.fromMap(json.decode(str));

  factory SurahItemData.fromMap(Map<String, dynamic> json) => SurahItemData(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: Name.fromMap(json["name"]),
        revelation: Revelation.fromMap(json["revelation"]),
        tafsir: DataTafsir.fromMap(json["tafsir"]),
        preBismillah: json["preBismillah"],
        verses: List<Verse>.from(json["verses"].map((x) => Verse.fromMap(x))),
      );
}

class Name {
  Name({
    required this.short,
    required this.long,
    required this.transliteration,
    required this.translation,
  });

  final String short;
  final String long;
  final Translation transliteration;
  final Translation translation;

  factory Name.fromJson(String str) => Name.fromMap(json.decode(str));

  factory Name.fromMap(Map<String, dynamic> json) => Name(
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

  final String arab;
  final String en;
  final String id;

  factory Revelation.fromJson(String str) =>
      Revelation.fromMap(json.decode(str));

  factory Revelation.fromMap(Map<String, dynamic> json) => Revelation(
        arab: json["arab"],
        en: json["en"],
        id: json["id"],
      );
}

class DataTafsir {
  DataTafsir({
    required this.id,
  });

  final String id;

  factory DataTafsir.fromJson(String str) =>
      DataTafsir.fromMap(json.decode(str));

  factory DataTafsir.fromMap(Map<String, dynamic> json) => DataTafsir(
        id: json["id"],
      );
}

class Verse {
  Verse({
    required this.number,
    required this.meta,
    required this.text,
    required this.translation,
    required this.audio,
    required this.tafsir,
  });

  final Number number;
  final Meta meta;
  final TextData text;
  final Translation translation;
  final Audio audio;
  final VerseTafsir tafsir;

  factory Verse.fromJson(String str) => Verse.fromMap(json.decode(str));

  factory Verse.fromMap(Map<String, dynamic> json) => Verse(
        number: Number.fromMap(json["number"]),
        meta: Meta.fromMap(json["meta"]),
        text: TextData.fromMap(json["text"]),
        translation: Translation.fromMap(json["translation"]),
        audio: Audio.fromMap(json["audio"]),
        tafsir: VerseTafsir.fromMap(json["tafsir"]),
      );
}

class Audio {
  Audio({
    required this.primary,
    required this.secondary,
  });

  final String primary;
  final List<String> secondary;

  factory Audio.fromJson(String str) => Audio.fromMap(json.decode(str));

  factory Audio.fromMap(Map<String, dynamic> json) => Audio(
        primary: json["primary"],
        secondary: List<String>.from(json["secondary"].map((x) => x)),
      );
}

class Meta {
  Meta({
    required this.juz,
    required this.page,
    required this.manzil,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  final int juz;
  final int page;
  final int manzil;
  final int ruku;
  final int hizbQuarter;
  final Sajda sajda;

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        juz: json["juz"],
        page: json["page"],
        manzil: json["manzil"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: Sajda.fromMap(json["sajda"]),
      );
}

class Sajda {
  Sajda({
    required this.recommended,
    required this.obligatory,
  });

  final bool recommended;
  final bool obligatory;

  factory Sajda.fromJson(String str) => Sajda.fromMap(json.decode(str));

  factory Sajda.fromMap(Map<String, dynamic> json) => Sajda(
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );
}

class Number {
  Number({
    required this.inQuran,
    required this.inSurah,
  });

  final int inQuran;
  final int inSurah;

  factory Number.fromJson(String str) => Number.fromMap(json.decode(str));

  factory Number.fromMap(Map<String, dynamic> json) => Number(
        inQuran: json["inQuran"],
        inSurah: json["inSurah"],
      );
}

class VerseTafsir {
  VerseTafsir({
    required this.id,
  });

  final Id id;

  factory VerseTafsir.fromJson(String str) =>
      VerseTafsir.fromMap(json.decode(str));

  factory VerseTafsir.fromMap(Map<String, dynamic> json) => VerseTafsir(
        id: Id.fromMap(json["id"]),
      );
}

class Id {
  Id({
    required this.short,
    required this.long,
  });

  final String short;
  final String long;

  factory Id.fromJson(String str) => Id.fromMap(json.decode(str));

  factory Id.fromMap(Map<String, dynamic> json) => Id(
        short: json["short"],
        long: json["long"],
      );
}

class TextData {
  TextData({
    required this.arab,
    required this.transliteration,
  });

  final String arab;
  final Transliteration transliteration;

  factory TextData.fromJson(String str) => TextData.fromMap(json.decode(str));

  factory TextData.fromMap(Map<String, dynamic> json) => TextData(
        arab: json["arab"],
        transliteration: Transliteration.fromMap(json["transliteration"]),
      );
}

class Transliteration {
  Transliteration({
    required this.en,
  });

  final String en;

  factory Transliteration.fromJson(String str) =>
      Transliteration.fromMap(json.decode(str));

  factory Transliteration.fromMap(Map<String, dynamic> json) => Transliteration(
        en: json["en"],
      );
}
