import 'package:api_exception/api_exception.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/model/quran_item.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/model/surah_item.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/service/quran_service.dart';

abstract class QuranRepository {
  Future<List<QuranItemData>> quranAll();
  Future<SurahItem> surahItem(int surah);
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

  @override
  Future<SurahItem> surahItem(int surah) async {
    try {
      final surahItem = await _quranService.surahDetail(surah);
      return surahItem;
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
