part of 'video_dakwah_cubit.dart';

enum VideoDakwahStatus {
  initial,
  loading,
  loadingGenre,
  loadingVideo,
  loadingMetaData,
  success,
  failure,
}

extension VideoDakwahStatusX on VideoDakwahStatus {
  bool get isInitial => this == VideoDakwahStatus.initial;
  bool get isLoading => this == VideoDakwahStatus.loading;
  bool get isLoadingGenre => this == VideoDakwahStatus.loadingGenre;
  bool get isLoadingVideo => this == VideoDakwahStatus.loadingVideo;
  bool get isLoadingMetaData => this == VideoDakwahStatus.loadingMetaData;
  bool get isSuccess => this == VideoDakwahStatus.success;
  bool get isFailure => this == VideoDakwahStatus.failure;
}

class VideoDakwahState extends Equatable {
  const VideoDakwahState({
    this.status = VideoDakwahStatus.initial,
    this.exception,
    this.videoGenreData,
    this.videoDakwahItem,
    this.youtubeDataModel,
  });

  final VideoDakwahStatus status;
  final AppException? exception;
  final List<VideoTypesData>? videoGenreData;
  final List<VideoItemData>? videoDakwahItem;
  final YoutubeDataModel? youtubeDataModel;

  VideoDakwahState copyWith({
    VideoDakwahStatus? status,
    AppException? exception,
    List<VideoTypesData>? videoGenreData,
    List<VideoItemData>? videoDakwahItem,
    YoutubeDataModel? youtubeDataModel,
  }) {
    return VideoDakwahState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      videoGenreData: videoGenreData ?? this.videoGenreData,
      videoDakwahItem: videoDakwahItem ?? this.videoDakwahItem,
      youtubeDataModel: youtubeDataModel ?? this.youtubeDataModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        videoGenreData,
        videoDakwahItem,
        youtubeDataModel,
      ];
}
