import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/model/quran_item.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/model/surah_item.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/repository/quran_repository.dart';
import 'package:flutter_exception/flutter_exception.dart';

part 'alquran_state.dart';

class AlquranCubit extends Cubit<AlquranState> {
  AlquranCubit(this._quranRepository) : super(const AlquranState());

  final QuranRepository _quranRepository;

  Future<void> alQuranAll() async {
    emit(state.copyWith(status: AlquranStatus.loading));
    try {
      final response = await _quranRepository.quranAll();
      emit(state.copyWith(
        status: AlquranStatus.success,
        alQuranAll: response,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: AlquranStatus.failure,
        exception: e,
      ));
    }
  }

  Future<void> surahDetail(int surah) async {
    emit(state.copyWith(status: AlquranStatus.loading));
    try {
      final response = await _quranRepository.surahItem(surah);
      emit(state.copyWith(
        status: AlquranStatus.success,
        surahDetail: response,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: AlquranStatus.failure,
        exception: e,
      ));
    }
  }
}
