import 'package:flutter_bil_hikmah/feature/al_quran/domain/model/quran_item.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/service/quran_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late QuranService quranService;
  setUp(() {
    quranService = QuranServiceImpl.create();
  });

  group("Test Al-Quran", () {
    test("Test init al quran all", () async {
      final item = await quranService.quranAll();
      expect(item, isA<QuranItem>());
    });
  });
}
