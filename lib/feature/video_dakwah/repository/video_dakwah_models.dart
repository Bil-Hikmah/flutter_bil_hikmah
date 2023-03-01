import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bil_hikmah/common/repository/dakwah_genre.dart';

class VideoDakwahModels {
  final DateTime dateCreated;
  final String description;
  final String genre;
  final String title;
  final String videoURL;

  VideoDakwahModels({
    required this.dateCreated,
    required this.description,
    required this.genre,
    required this.title,
    required this.videoURL,
  });

  VideoDakwahGenre get enumGenre {
    switch (genre) {
      case 'disabilitas':
        return VideoDakwahGenre.disabilitas;
      case 'dakwah':
        return VideoDakwahGenre.dakwah;
      case 'khutbah':
        return VideoDakwahGenre.khutbah;
      case 'quran':
        return VideoDakwahGenre.quran;
      case 'hadist':
        return VideoDakwahGenre.hadist;
      case 'sejarah':
        return VideoDakwahGenre.sejarah;
      case 'fiqih':
        return VideoDakwahGenre.fiqih;
      case 'akhlak':
        return VideoDakwahGenre.akhlak;
      case 'umum':
        return VideoDakwahGenre.umum;
      case 'lainnya':
        return VideoDakwahGenre.lainnya;
      default:
        return VideoDakwahGenre.semua;
    }
  }

  factory VideoDakwahModels.fromJson(Map<String, dynamic> json) {
    return VideoDakwahModels(
      dateCreated: (json['date_created'] as Timestamp).toDate(),
      description: json['description'],
      genre: json['genre'],
      title: json['title'],
      videoURL: json['video_url'],
    );
  }
}
