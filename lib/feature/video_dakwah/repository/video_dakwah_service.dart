import 'package:api_exception/api_exception.dart';
import 'package:flutter_bil_hikmah/common/network/firebase_service.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_models.dart';

abstract class VideoDakwahService {
  Future<List<VideoDakwahModels>> onGetVideoDakwah();
  Future<List<VideoDakwahModels>> onGetVideoDakwahWithGenre(String genre);
}

class VideoDakwahServiceImpl implements VideoDakwahService {
  final FirebaseService firebaseService;

  VideoDakwahServiceImpl(
    this.firebaseService,
  );

  @override
  Future<List<VideoDakwahModels>> onGetVideoDakwah() async {
    try {
      final response = await firebaseService.getAllDocument();
      return response!
          .map((e) => VideoDakwahModels.fromJson(e.data()))
          .toList();
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<List<VideoDakwahModels>> onGetVideoDakwahWithGenre(
      String genre) async {
    try {
      final response =
          await firebaseService.getDocumentFilteredWhere("genre", genre);
      return response!
          .map((e) => VideoDakwahModels.fromJson(e.data()))
          .toList();
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  factory VideoDakwahServiceImpl.create() {
    return VideoDakwahServiceImpl(
      FirebaseServiceImplementation.create("video_dakwah"),
    );
  }
}
