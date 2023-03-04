import 'package:flutter_bil_hikmah/feature/poster/domain/model/poster_response.dart';
import 'package:flutter_bil_hikmah/feature/poster/domain/service/poster_service.dart';

abstract class PosterRepository {
  Future<List<PosterResponse>> onGetPoster();
}

class PosterRepositoryImpl implements PosterRepository {
  final PosterService service;

  PosterRepositoryImpl(this.service);

  @override
  Future<List<PosterResponse>> onGetPoster() async {
    return await service.onGetPoster();
  }

  factory PosterRepositoryImpl.create() {
    return PosterRepositoryImpl(
      PosterServiceImpl.create(),
    );
  }
}
