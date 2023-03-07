import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/repository/amalan_sunnah_item.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/repository/amalan_sunnah_repository.dart';

part 'amalan_sunnah_state.dart';

class AmalanSunnahCubit extends Cubit<AmalanSunnahState> {
  AmalanSunnahCubit() : super(const AmalanSunnahState());

  final _amalanSunnahRepository = AmalanSunnahRepositoryImpl.create();

  Future<void> getAllAmalanSunnah() async {
    emit(state.copyWith(status: AmalanSunnahStateStatus.loading));
    try {
      final data = await _amalanSunnahRepository.getAllAmalanSunnah();
      emit(state.copyWith(
        status: AmalanSunnahStateStatus.loaded,
        amalanSunnahItem: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AmalanSunnahStateStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
