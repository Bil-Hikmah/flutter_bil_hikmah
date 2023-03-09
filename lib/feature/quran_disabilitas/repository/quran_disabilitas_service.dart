import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bil_hikmah/common/network/firebase_service.dart';
import 'package:flutter_bil_hikmah/feature/quran_disabilitas/repository/quran_disabilitas_item.dart';

abstract class QuranDisbailitasService {
  Future<List<QuranDisabilitas>> getQuranDisbailitas();
}

class QuranDisbailitasServiceImpl implements QuranDisbailitasService {
  QuranDisbailitasServiceImpl(this.firebaseService);

  final FirebaseService firebaseService;

  @override
  Future<List<QuranDisabilitas>> getQuranDisbailitas() async {
    try {
      final response = await firebaseService.getAllDocument();
      return response?.map<QuranDisabilitas>(
            (QueryDocumentSnapshot<Map<String, dynamic>> e) {
              return QuranDisabilitas.fromJson(e.data());
            },
          ).toList() ??
          [];
    } catch (e) {
      throw QuranDisabilitasServiceError(e.toString());
    }
  }

  factory QuranDisbailitasServiceImpl.create() {
    return QuranDisbailitasServiceImpl(
        FirebaseServiceImplementation.create("quran_isyarat"));
  }
}

class QuranDisabilitasServiceError implements Exception {
  QuranDisabilitasServiceError(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}
