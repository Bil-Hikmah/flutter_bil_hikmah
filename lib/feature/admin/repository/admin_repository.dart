import 'package:flutter_bil_hikmah/feature/admin/repository/admin_service.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/repository/amalan_sunnah_item.dart';

abstract class AdminRepository {
  Future<String> onAddAmalanSunnah(AmalanSunnahItem item);
}

class AdminRepositoryImpl implements AdminRepository {
  @override
  Future<String> onAddAmalanSunnah(AmalanSunnahItem item) {
    final AdminService _adminService = AdminServiceImpl.create("amalan_sunnah");
    return _adminService.onAddAmalanSunnah(item.toMap());
  }
}
