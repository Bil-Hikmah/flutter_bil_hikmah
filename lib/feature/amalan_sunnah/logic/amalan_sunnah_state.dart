part of 'amalan_sunnah_cubit.dart';

enum AmalanSunnahStateStatus { initial, loading, loaded, error }

class AmalanSunnahState extends Equatable {
  const AmalanSunnahState({
    this.status = AmalanSunnahStateStatus.initial,
    this.errorMessage,
    this.amalanSunnahItem = const [],
  });

  final AmalanSunnahStateStatus status;
  final String? errorMessage;
  final List<AmalanSunnahItem> amalanSunnahItem;

  AmalanSunnahState copyWith({
    AmalanSunnahStateStatus? status,
    String? errorMessage,
    List<AmalanSunnahItem>? amalanSunnahItem,
  }) {
    return AmalanSunnahState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      amalanSunnahItem: amalanSunnahItem ?? this.amalanSunnahItem,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        amalanSunnahItem,
      ];
}
