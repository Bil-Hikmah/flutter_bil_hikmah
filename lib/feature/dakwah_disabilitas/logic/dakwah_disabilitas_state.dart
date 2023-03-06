part of 'dakwah_disabilitas_cubit.dart';

enum DakwahDisabilitasStateStatus {
  initial,
  loading,
  success,
  failure,
}

class DakwahDisabilitasState extends Equatable {
  const DakwahDisabilitasState({
    this.status = DakwahDisabilitasStateStatus.initial,
    this.errorMessage = "",
    this.videoDakwahItem,
  });

  final DakwahDisabilitasStateStatus status;
  final String errorMessage;
  final List<VideoDakwahModels>? videoDakwahItem;

  DakwahDisabilitasState copyWith({
    DakwahDisabilitasStateStatus? status,
    String? errorMessage,
    List<VideoDakwahModels>? videoDakwahItem,
  }) {
    return DakwahDisabilitasState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      videoDakwahItem: videoDakwahItem ?? this.videoDakwahItem,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        videoDakwahItem,
      ];
}
