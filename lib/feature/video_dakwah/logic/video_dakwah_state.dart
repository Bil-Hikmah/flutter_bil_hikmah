part of 'video_dakwah_cubit.dart';

enum VideoDakwahStatus {
  initial,
  loading,
  loadingGenre,
  loadingVideo,
  loadingSearch,
  loadingMetaData,
  success,
  failure,
}

extension VideoDakwahStatusX on VideoDakwahStatus {
  bool get isInitial => this == VideoDakwahStatus.initial;
  bool get isLoading => this == VideoDakwahStatus.loading;
  bool get isLoadingGenre => this == VideoDakwahStatus.loadingGenre;
  bool get isLoadingVideo => this == VideoDakwahStatus.loadingVideo;
  bool get isLoadingSearch => this == VideoDakwahStatus.loadingSearch;
  bool get isLoadingMetaData => this == VideoDakwahStatus.loadingMetaData;
  bool get isSuccess => this == VideoDakwahStatus.success;
  bool get isFailure => this == VideoDakwahStatus.failure;
}

class VideoDakwahState extends Equatable {
  const VideoDakwahState({
    this.status = VideoDakwahStatus.initial,
    this.exception,
    this.videoDakwahItem,
    this.videoDakwahTemp,
    this.youtubeDataModel,
  });

  final VideoDakwahStatus status;
  final AppException? exception;
  final List<VideoDakwahModels>? videoDakwahItem;
  final List<VideoDakwahModels>? videoDakwahTemp;
  final YoutubeDataModel? youtubeDataModel;

  VideoDakwahState copyWith({
    VideoDakwahStatus? status,
    AppException? exception,
    List<VideoDakwahModels>? videoDakwahItem,
    List<VideoDakwahModels>? videoDakwahTemp,
    YoutubeDataModel? youtubeDataModel,
  }) {
    return VideoDakwahState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      videoDakwahItem: videoDakwahItem ?? this.videoDakwahItem,
      videoDakwahTemp: videoDakwahTemp ?? this.videoDakwahTemp,
      youtubeDataModel: youtubeDataModel ?? this.youtubeDataModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        videoDakwahItem,
        videoDakwahTemp,
        youtubeDataModel,
      ];
}
