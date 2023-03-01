import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_models.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_service.dart';

abstract class VideoDakwahRepository {
  Future<List<VideoDakwahModels>> onGetVideoDakwah();
  Future<List<VideoDakwahModels>> onGetVideoDakwahWithGenre(String genre);
}

class VideoDakwahRepositoryImpl implements VideoDakwahRepository {
  final VideoDakwahService _videoDakwahService;

  VideoDakwahRepositoryImpl(this._videoDakwahService);

  @override
  Future<List<VideoDakwahModels>> onGetVideoDakwah() async {
    return await _videoDakwahService.onGetVideoDakwah();
  }

  @override
  Future<List<VideoDakwahModels>> onGetVideoDakwahWithGenre(
      String genre) async {
    return await _videoDakwahService.onGetVideoDakwahWithGenre(genre);
  }

  factory VideoDakwahRepositoryImpl.create() {
    return VideoDakwahRepositoryImpl(
      VideoDakwahServiceImpl.create(),
    );
  }
}
