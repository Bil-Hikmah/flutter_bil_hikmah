import 'package:api_exception/api_exception.dart';
import 'package:flutter_bil_hikmah/common/network/firebase_service.dart';

abstract class AdminService {
  Future<String> onAddAmalanSunnah(Map<String, dynamic> item);
}

class AdminServiceImpl implements AdminService {
  final FirebaseService firebaseService;

  AdminServiceImpl(
    this.firebaseService,
  );

  @override
  Future<String> onAddAmalanSunnah(Map<String, dynamic> item) async {
    try {
      final response = await firebaseService.addNewDocument(item);
      return response.id;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  factory AdminServiceImpl.create(String collection) {
    return AdminServiceImpl(
      FirebaseServiceImplementation.create(collection),
    );
  }
}
