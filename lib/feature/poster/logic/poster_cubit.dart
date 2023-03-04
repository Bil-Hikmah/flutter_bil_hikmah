import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/feature/poster/domain/model/poster_response.dart';
import 'package:flutter_bil_hikmah/feature/poster/domain/repository/poster_repository.dart';

part 'poster_state.dart';

class PosterCubit extends Cubit<PosterState> {
  PosterCubit() : super(const PosterState());

  final PosterRepository repository = PosterRepositoryImpl.create();

  Future<void> onGetPoster() async {
    emit(state.copyWith(status: PosterStateStatus.loading));
    try {
      final response = await repository.onGetPoster();
      emit(state.copyWith(
        status: PosterStateStatus.loaded,
        poster: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: PosterStateStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
