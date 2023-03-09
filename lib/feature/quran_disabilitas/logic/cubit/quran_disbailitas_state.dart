part of 'quran_disbailitas_cubit.dart';

enum QuranDisabilitasStateStatus {
  initial,
  loading,
  success,
  error,
}

class QuranDisbailitasState extends Equatable {
  const QuranDisbailitasState({
    this.status = QuranDisabilitasStateStatus.initial,
    this.errorMessage,
    this.quranDisabilitas = const [],
  });

  final QuranDisabilitasStateStatus status;
  final String? errorMessage;
  final List<QuranDisabilitas> quranDisabilitas;

  QuranDisbailitasState copyWith({
    QuranDisabilitasStateStatus? status,
    String? errorMessage,
    List<QuranDisabilitas>? quranDisabilitas,
  }) {
    return QuranDisbailitasState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      quranDisabilitas: quranDisabilitas ?? this.quranDisabilitas,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        quranDisabilitas,
      ];
}
