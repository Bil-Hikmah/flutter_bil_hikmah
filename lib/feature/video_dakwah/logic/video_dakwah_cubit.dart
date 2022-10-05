import 'package:api_exception/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_repository.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_genre_response.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'video_dakwah_state.dart';

class VideoDakwahCubit extends Cubit<VideoDakwahState> {
  VideoDakwahCubit() : super(const VideoDakwahState());

  final VideoDakwahRepository _repository = VideoDakwahRepositoryImpl.create();

  Future<void> onInit() async {
    emit(state.copyWith(status: VideoDakwahStatus.loading));
    try {
      final videoGenre = await _repository.getGenreVideo();

      final videoItem = await _repository.onGetVideoItem(null);
      emit(state.copyWith(
        status: VideoDakwahStatus.success,
        videoGenreData: videoGenre,
        videoDakwahItem: videoItem,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: VideoDakwahStatus.failure,
        exception: e,
      ));
    }
  }

  Future<void> onGetVideoGenre(int idTypeVideo) async {
    emit(state.copyWith(status: VideoDakwahStatus.loadingVideo));
    try {
      final response = await _repository.onGetVideoItem(idTypeVideo);
      emit(state.copyWith(
        status: VideoDakwahStatus.success,
        videoDakwahItem: response,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: VideoDakwahStatus.failure,
        exception: e,
      ));
    }
  }
}
