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
  });

  final HomeStateStatus status;
  final AppException? exception;

  HomeState copyWith({
    HomeStateStatus? status,
    AppException? exception,
  }) {
    return HomeState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
      ];
}
