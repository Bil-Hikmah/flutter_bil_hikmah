import 'package:flutter_bil_hikmah/common/network/firebase_service.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/repository/amalan_sunnah_item.dart';

abstract class AmalanSunnahService {
  Future<List<AmalanSunnahItem>> getAllAmalanSunnah();
}

class AmalanSunnahServiceImpl implements AmalanSunnahService {
  final FirebaseService firebaseService;

  AmalanSunnahServiceImpl(this.firebaseService);

  @override
  Future<List<AmalanSunnahItem>> getAllAmalanSunnah() async {
    final data = await firebaseService.getAllDocument();
    return data!.map((e) => AmalanSunnahItem.fromJson(e.data())).toList();
  }

  factory AmalanSunnahServiceImpl.create() {
    return AmalanSunnahServiceImpl(
      FirebaseServiceImplementation.create("amalan_sunnah"),
    );
  }
}
