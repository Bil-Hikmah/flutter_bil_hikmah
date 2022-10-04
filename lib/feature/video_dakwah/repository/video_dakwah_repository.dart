import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_service.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_genre_response.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_item.dart';
import 'package:flutter_exception/flutter_exception.dart';

abstract class VideoDakwahRepository {
  Future<List<VideoTypesData>> getGenreVideo();
  Future<List<VideoItemData>> onGetVideoItem(int? idTypeVideo);
}

class VideoDakwahRepositoryImpl implements VideoDakwahRepository {
  final VideoDakwahService _videoDakwahService;

  VideoDakwahRepositoryImpl(this._videoDakwahService);

  @override
  Future<List<VideoTypesData>> getGenreVideo() async {
    try {
      return await _videoDakwahService.getVideoGenre();
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<List<VideoItemData>> onGetVideoItem(int? idTypeVideo) async {
    try {
      return await _videoDakwahService.onGetVideoItem(idTypeVideo);
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException(
        message: e.toString(),
      );
    }
  }

  factory VideoDakwahRepositoryImpl.create() {
    return VideoDakwahRepositoryImpl(
      VideoDakwahServiceImpl.create(),
    );
  }
}
