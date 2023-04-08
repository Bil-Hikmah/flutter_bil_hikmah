part of 'home_cubit.dart';

enum HomeStateStatus {
  initial,
  loading,
  loadingChangeCity,
  loadedChangeCity,
  loaded,
  error,
}

extension HomeStateStatusExt on HomeStateStatus {
  bool get isLoading => this == HomeStateStatus.loading;
  bool get isLoadingChangeCity => this == HomeStateStatus.loadingChangeCity;
  bool get isLoadedChangeCity => this == HomeStateStatus.loadedChangeCity;
  bool get isLoaded => this == HomeStateStatus.loaded;
  bool get isError => this == HomeStateStatus.error;
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStateStatus.initial,
    this.exception,
    this.streamedTime,
    this.adhanSchedule,
    this.smallDakwah = const [],
    this.cityAdhan = 'yogyakarta',
  });

  final HomeStateStatus status;
  final AppException? exception;
  final DateTime? streamedTime;
  final AdhanSchedule? adhanSchedule;
  final List<VideoDakwahModels> smallDakwah;
  final String cityAdhan;

  HomeState copyWith({
    HomeStateStatus? status,
    AppException? exception,
    DateTime? streamedTime,
    AdhanSchedule? adhanSchedule,
    List<VideoDakwahModels>? smallDakwah,
    String? cityAdhan,
  }) {
    return HomeState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      streamedTime: streamedTime ?? this.streamedTime,
      adhanSchedule: adhanSchedule ?? this.adhanSchedule,
      smallDakwah: smallDakwah ?? this.smallDakwah,
      cityAdhan: cityAdhan ?? this.cityAdhan,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        streamedTime,
        adhanSchedule,
        smallDakwah,
        cityAdhan,
      ];
}
