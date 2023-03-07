import 'package:flutter_bil_hikmah/feature/amalan_sunnah/repository/amalan_sunnah_item.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/repository/amalan_sunnah_service.dart';

abstract class AmalanSunnahRepository {
  Future<List<AmalanSunnahItem>> getAllAmalanSunnah();
}

class AmalanSunnahRepositoryImpl implements AmalanSunnahRepository {
  final AmalanSunnahService amalanSunnahService;

  AmalanSunnahRepositoryImpl(this.amalanSunnahService);

  @override
  Future<List<AmalanSunnahItem>> getAllAmalanSunnah() async {
    return await amalanSunnahService.getAllAmalanSunnah();
  }

  factory AmalanSunnahRepositoryImpl.create() {
    return AmalanSunnahRepositoryImpl(AmalanSunnahServiceImpl.create());
  }
}
