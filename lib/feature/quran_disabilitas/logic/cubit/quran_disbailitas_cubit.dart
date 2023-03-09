import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/feature/quran_disabilitas/repository/quran_disabilitas_item.dart';
import 'package:flutter_bil_hikmah/feature/quran_disabilitas/repository/quran_disabilitas_service.dart';
import 'package:flutter_bil_hikmah/feature/quran_disabilitas/repository/quran_disbailitas_repository.dart';

part 'quran_disbailitas_state.dart';

class QuranDisbailitasCubit extends Cubit<QuranDisbailitasState> {
  QuranDisbailitasCubit() : super(const QuranDisbailitasState());

  final QuranDisabilitasRepostiroy repository =
      QuranDisabilitasRepositoryImpl.create();

  Future<void> initQuranDisbailtias() async {
    emit(state.copyWith(status: QuranDisabilitasStateStatus.loading));
    try {
      final response = await repository.quranDisbailitas();
      emit(state.copyWith(
        status: QuranDisabilitasStateStatus.success,
        quranDisabilitas: response,
      ));
    } on QuranDisabilitasServiceError catch (e) {
      emit(state.copyWith(
        status: QuranDisabilitasStateStatus.error,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: QuranDisabilitasStateStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
