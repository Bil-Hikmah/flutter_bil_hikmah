import 'package:api_exception/api_exception.dart';
import 'package:flutter_bil_hikmah/common/network/firebase_service.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/domain/models/sign_language_response.dart';

abstract class SignLanguageService {
  Future<List<SignLanguageResponse>> onGetSignLanguage();
}

class SignLanguageServiceImplementation implements SignLanguageService {
  final FirebaseService firebaseService;

  SignLanguageServiceImplementation(this.firebaseService);

  @override
  Future<List<SignLanguageResponse>> onGetSignLanguage() async {
    try {
      final response = await firebaseService.getAllDocument();

      return response!
          .map<SignLanguageResponse>(
              (e) => SignLanguageResponse.fromJson(e.data()))
          .toList();
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  factory SignLanguageServiceImplementation.create() {
    return SignLanguageServiceImplementation(
      FirebaseServiceImplementation.create("bahasa_isyarat"),
    );
  }
}
