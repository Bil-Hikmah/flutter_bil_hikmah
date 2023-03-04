import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bil_hikmah/common/repository/dakwah_genre.dart';

class PosterResponse {
  final DateTime dateCreated;
  final String genre;
  final String imageURL;

  PosterResponse({
    required this.dateCreated,
    required this.genre,
    required this.imageURL,
  });

  VideoDakwahGenre get genreName {
    return enumGenre(genre);
  }

  factory PosterResponse.fromJson(Map<String, dynamic> json) {
    return PosterResponse(
      dateCreated: (json['date_created'] as Timestamp).toDate(),
      genre: json['genre'],
      imageURL: json['image_url'],
    );
  }
}
