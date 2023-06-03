part of 'admin_cubit.dart';

enum AdminStatus {
  initial,
  loading,
  loaded,
  error,
}

class AdminState extends Equatable {
  const AdminState({
    this.status = AdminStatus.initial,
    this.errorMessage = "",
  });

  final AdminStatus status;
  final String errorMessage;

  AdminState copyWith({
    AdminStatus? status,
    String? errorMessage,
  }) {
    return AdminState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage,
      ];
}
