import 'package:api_exception/exception.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/domain/models/sign_language_response.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/domain/repository/sign_language_repository.dart';

part 'sign_language_state.dart';

class SignLanguageCubit extends Cubit<SignLanguageState> {
  SignLanguageCubit() : super(const SignLanguageState());

  final signLanguageRepository = SignLanguageRepositoryImplementation.create();

  Future<void> onInitSignLanguage() async {
    emit(state.copyWith(status: SignLanguageStateStatus.loading));
    try {
      final response = await signLanguageRepository.onGetSignLanguage();
      emit(state.copyWith(
        signLanguageResponse: response,
        status: SignLanguageStateStatus.loaded,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        errorMessage: e.message,
        status: SignLanguageStateStatus.error,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
        status: SignLanguageStateStatus.error,
      ));
    }
  }
}
