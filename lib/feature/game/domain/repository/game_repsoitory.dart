import 'package:flutter_bil_hikmah/feature/game/domain/model/game_response.dart';
import 'package:flutter_bil_hikmah/feature/game/domain/service/game_service.dart';

abstract class GameRepository {
  Future<List<Game>> onGetGameItem();
}

class GameRepositoryImpl implements GameRepository {
  GameRepositoryImpl(this.service);

  final GamerService service;

  @override
  Future<List<Game>> onGetGameItem() async {
    return await service.onGetGameItem();
  }

  factory GameRepositoryImpl.create() {
    return GameRepositoryImpl(
      GamerServiceImpl.create(),
    );
  }
}
