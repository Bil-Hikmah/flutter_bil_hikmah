import 'package:flutter_bil_hikmah/feature/quran_disabilitas/repository/quran_disabilitas_item.dart';
import 'package:flutter_bil_hikmah/feature/quran_disabilitas/repository/quran_disabilitas_service.dart';

abstract class QuranDisabilitasRepostiroy {
  Future<List<QuranDisabilitas>> quranDisbailitas();
}

class QuranDisabilitasRepositoryImpl implements QuranDisabilitasRepostiroy {
  QuranDisabilitasRepositoryImpl(this.service);

  final QuranDisbailitasService service;

  @override
  Future<List<QuranDisabilitas>> quranDisbailitas() async {
    return await service.getQuranDisbailitas();
  }

  factory QuranDisabilitasRepositoryImpl.create() {
    return QuranDisabilitasRepositoryImpl(QuranDisbailitasServiceImpl.create());
  }
}
