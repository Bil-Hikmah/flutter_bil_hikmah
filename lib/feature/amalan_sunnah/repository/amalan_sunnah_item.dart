class AmalanSunnahItem {
  final String title;
  final String webURL;

  AmalanSunnahItem({
    required this.title,
    required this.webURL,
  });

  factory AmalanSunnahItem.fromJson(Map<String, dynamic> json) {
    return AmalanSunnahItem(
      title: json['title'],
      webURL: json['web_url'],
    );
  }
}
