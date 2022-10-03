import 'dart:convert';

class VideoItem {
  VideoItem({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final List<VideoItemData> data;

  factory VideoItem.fromJson(String str) => VideoItem.fromMap(json.decode(str));

  factory VideoItem.fromMap(Map<String, dynamic> json) => VideoItem(
        status: json["status"],
        message: json["message"],
        data: json["data"].isEmpty
            ? []
            : List<VideoItemData>.from(
                json["data"].map((x) => VideoItemData.fromMap(x))),
      );
}

class VideoItemData {
  VideoItemData({
    required this.id,
    required this.idTypeVideo,
    required this.videTitle,
    required this.videoUrl,
    required this.videoImg,
    required this.createdAt,
    required this.updatedAt,
    required this.titleCategory,
  });

  final int id;
  final int idTypeVideo;
  final String videTitle;
  final String videoUrl;
  final String videoImg;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String titleCategory;

  factory VideoItemData.fromJson(String str) =>
      VideoItemData.fromMap(json.decode(str));

  factory VideoItemData.fromMap(Map<String, dynamic> json) => VideoItemData(
        id: json["id"],
        idTypeVideo: json["id_type_video"],
        videTitle: json["vide_title"],
        videoUrl: json["video_url"],
        videoImg: json["video_img"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        titleCategory: json["title_category"],
      );
}
