part of 'video_dakwah_cubit.dart';

enum VideoDakwahStatus {
  initial,
  loading,
  loadingGenre,
  loadingVideo,
  success,
  failure,
}

extension VideoDakwahStatusX on VideoDakwahStatus {
  bool get isInitial => this == VideoDakwahStatus.initial;
  bool get isLoading => this == VideoDakwahStatus.loading;
  bool get isLoadingGenre => this == VideoDakwahStatus.loadingGenre;
  bool get isLoadingVideo => this == VideoDakwahStatus.loadingVideo;
  bool get isSuccess => this == VideoDakwahStatus.success;
  bool get isFailure => this == VideoDakwahStatus.failure;
}

class VideoDakwahState extends Equatable {
  const VideoDakwahState({
    this.status = VideoDakwahStatus.initial,
    this.exception,
    this.videoGenreData,
    this.videoDakwahItem,
  });

  final VideoDakwahStatus status;
  final AppException? exception;
  final List<VideoTypesData>? videoGenreData;
  final List<VideoItemData>? videoDakwahItem;

  VideoDakwahState copyWith({
    VideoDakwahStatus? status,
    AppException? exception,
    List<VideoTypesData>? videoGenreData,
    List<VideoItemData>? videoDakwahItem,
  }) {
    return VideoDakwahState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      videoGenreData: videoGenreData ?? this.videoGenreData,
      videoDakwahItem: videoDakwahItem ?? this.videoDakwahItem,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        videoGenreData,
        videoDakwahItem,
      ];
}
