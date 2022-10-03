import 'dart:convert';

class VideoTypes {
  VideoTypes({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final List<VideoTypesData> data;

  factory VideoTypes.fromJson(String str) =>
      VideoTypes.fromMap(json.decode(str));

  factory VideoTypes.fromMap(Map<String, dynamic> json) => VideoTypes(
        status: json["status"],
        message: json["message"],
        data: List<VideoTypesData>.from(
            json["data"].map((x) => VideoTypesData.fromMap(x))),
      );
}

class VideoTypesData {
  VideoTypesData({
    required this.id,
    required this.titleCategory,
  });

  final int id;
  final String titleCategory;

  factory VideoTypesData.fromJson(String str) =>
      VideoTypesData.fromMap(json.decode(str));

  factory VideoTypesData.fromMap(Map<String, dynamic> json) => VideoTypesData(
        id: json["id"],
        titleCategory: json["title_category"],
      );
}
