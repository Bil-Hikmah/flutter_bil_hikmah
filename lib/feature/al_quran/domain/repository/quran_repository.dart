import 'package:flutter_bil_hikmah/common/exception/exception.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/model/quran_item.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/service/quran_service.dart';

abstract class QuranRepository {
  Future<List<QuranItemData>> quranAll();
}

class QuranRepositoryImpl implements QuranRepository {
  final QuranService _quranService;

  QuranRepositoryImpl(this._quranService);

  @override
  Future<List<QuranItemData>> quranAll() async {
    try {
      final quranItem = await _quranService.quranAll();
      return quranItem.data;
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  factory QuranRepositoryImpl.create() {
    return QuranRepositoryImpl(
      QuranServiceImpl.create(),
    );
  }
}
