class QuranDisabilitas {
  final String surahName;
  final String videoURL;

  QuranDisabilitas({
    required this.surahName,
    required this.videoURL,
  });

  factory QuranDisabilitas.fromJson(Map<String, dynamic> json) {
    return QuranDisabilitas(
      surahName: json['surahName'],
      videoURL: json['videoURL'],
    );
  }
}
