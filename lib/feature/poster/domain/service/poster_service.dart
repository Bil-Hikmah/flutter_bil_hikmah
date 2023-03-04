import 'package:flutter_bil_hikmah/common/network/firebase_service.dart';
import 'package:flutter_bil_hikmah/feature/poster/domain/model/poster_response.dart';

abstract class PosterService {
  Future<List<PosterResponse>> onGetPoster();
}

class PosterServiceImpl implements PosterService {
  final FirebaseService firebaseService;

  PosterServiceImpl(this.firebaseService);

  @override
  Future<List<PosterResponse>> onGetPoster() async {
    try {
      final response = await firebaseService.getAllDocument();
      return response?.map((e) => PosterResponse.fromJson(e.data())).toList() ??
          [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  factory PosterServiceImpl.create() {
    return PosterServiceImpl(
      FirebaseServiceImplementation.create("poster_dakwah"),
    );
  }
}
