import 'package:api_exception/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_models.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_video_info/youtube_video_info.dart';

part 'video_dakwah_state.dart';

class VideoDakwahCubit extends Cubit<VideoDakwahState> {
  VideoDakwahCubit(this.repository) : super(const VideoDakwahState());

  final VideoDakwahRepository repository;

  Future<void> onInit() async {
    emit(state.copyWith(status: VideoDakwahStatus.loading));
    try {
      final videoDakwahItem = await repository.onGetVideoDakwah();
      emit(state.copyWith(
        status: VideoDakwahStatus.success,
        videoDakwahTemp: videoDakwahItem,
        videoDakwahItem: videoDakwahItem,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: VideoDakwahStatus.failure,
        exception: e,
      ));
    }
  }

  Future<void> onGetVideoWithGenre(String genre) async {
    emit(state.copyWith(status: VideoDakwahStatus.loadingGenre));
    try {
      final List<VideoDakwahModels> videoDakwahItem;
      if (genre == "semua") {
        videoDakwahItem = await repository.onGetVideoDakwah();
      } else {
        videoDakwahItem = await repository.onGetVideoDakwahWithGenre(genre);
      }

      emit(state.copyWith(
        status: VideoDakwahStatus.success,
        videoDakwahItem: videoDakwahItem,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: VideoDakwahStatus.failure,
        exception: e,
      ));
    }
  }

  Future<void> onGetYouTubeMetaData(String urlVideo) async {
    emit(state.copyWith(status: VideoDakwahStatus.loadingMetaData));
    try {
      final response = await YoutubeData.getData(urlVideo);
      emit(state.copyWith(
        status: VideoDakwahStatus.success,
        youtubeDataModel: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: VideoDakwahStatus.failure,
        exception: UnknownException(
          message: e.toString(),
        ),
      ));
    }
  }

  Future<void> onGetVideoWithSearch(String keyword) async {
    emit(state.copyWith(status: VideoDakwahStatus.loadingSearch));
    try {
      final videoDakwahItem = state.videoDakwahTemp?.where((element) {
            final title = element.title.toLowerCase();
            final search = keyword.toLowerCase();
            return title.contains(search);
          }).toList() ??
          [];

      emit(state.copyWith(
        status: VideoDakwahStatus.success,
        videoDakwahItem: videoDakwahItem,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: VideoDakwahStatus.failure,
        exception: e,
      ));
    }
  }
}
