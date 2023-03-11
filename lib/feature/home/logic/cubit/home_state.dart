part of 'home_cubit.dart';

enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

extension HomeStateStatusExt on HomeStateStatus {
  bool get isLoading => this == HomeStateStatus.loading;
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
  });

  final HomeStateStatus status;
  final AppException? exception;
  final DateTime? streamedTime;
  final AdhanSchedule? adhanSchedule;
  final List<VideoDakwahModels> smallDakwah;

  HomeState copyWith({
    HomeStateStatus? status,
    AppException? exception,
    DateTime? streamedTime,
    AdhanSchedule? adhanSchedule,
    List<VideoDakwahModels>? smallDakwah,
  }) {
    return HomeState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      streamedTime: streamedTime ?? this.streamedTime,
      adhanSchedule: adhanSchedule ?? this.adhanSchedule,
      smallDakwah: smallDakwah ?? this.smallDakwah,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        streamedTime,
        adhanSchedule,
        smallDakwah,
      ];
}
