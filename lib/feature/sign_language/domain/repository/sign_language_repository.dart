import 'package:flutter_bil_hikmah/feature/sign_language/domain/models/sign_language_response.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/domain/service/sign_language_service.dart';

abstract class SignLanguageRepository {
  Future<List<SignLanguageResponse>> onGetSignLanguage();
}

class SignLanguageRepositoryImplementation implements SignLanguageRepository {
  final SignLanguageService signLanguageService;

  SignLanguageRepositoryImplementation(this.signLanguageService);

  @override
  Future<List<SignLanguageResponse>> onGetSignLanguage() async {
    return await signLanguageService.onGetSignLanguage();
  }

  factory SignLanguageRepositoryImplementation.create() {
    return SignLanguageRepositoryImplementation(
      SignLanguageServiceImplementation.create(),
    );
  }
}
