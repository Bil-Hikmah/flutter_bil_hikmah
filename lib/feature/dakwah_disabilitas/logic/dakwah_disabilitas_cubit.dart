import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_models.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_repository.dart';

part 'dakwah_disabilitas_state.dart';

class DakwahDisabilitasCubit extends Cubit<DakwahDisabilitasState> {
  DakwahDisabilitasCubit() : super(const DakwahDisabilitasState());

  final VideoDakwahRepository _repository = VideoDakwahRepositoryImpl.create();

  Future<void> onInitDakwahDisbailitas() async {
    emit(state.copyWith(status: DakwahDisabilitasStateStatus.loading));
    try {
      final response =
          await _repository.onGetVideoDakwahWithGenre("disabilitas");
      emit(state.copyWith(
        status: DakwahDisabilitasStateStatus.success,
        videoDakwahItem: response,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: DakwahDisabilitasStateStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
