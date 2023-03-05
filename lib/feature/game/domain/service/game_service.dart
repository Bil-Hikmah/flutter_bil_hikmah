import 'package:api_exception/exception.dart';
import 'package:flutter_bil_hikmah/common/network/firebase_service.dart';
import 'package:flutter_bil_hikmah/feature/game/domain/model/game_response.dart';

abstract class GamerService {
  Future<List<Game>> onGetGameItem();
}

class GamerServiceImpl implements GamerService {
  GamerServiceImpl(this.firebaseService);

  final FirebaseService firebaseService;

  @override
  Future<List<Game>> onGetGameItem() async {
    try {
      final response = await firebaseService.getAllDocument();
      return response?.map<Game>((e) => Game.fromJson(e.data())).toList() ?? [];
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  factory GamerServiceImpl.create() {
    return GamerServiceImpl(
      FirebaseServiceImplementation.create("game_isyarat"),
    );
  }
}
