part of 'profile_cubit.dart';

enum ProfileStatus {
  initial,
  loading,
  success,
  successUpdateDisplayName,
  failure
}

class ProfileState extends Equatable {
  const ProfileState({
    this.status = ProfileStatus.initial,
    this.errorMessage = "Unknown Error - Default",
    this.updatedDisplayName = "",
  });

  final ProfileStatus status;
  final String errorMessage;
  final String updatedDisplayName;

  ProfileState copyWith({
    ProfileStatus? status,
    String? errorMessage,
    String? updatedDisplayName,
  }) {
    return ProfileState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      updatedDisplayName: updatedDisplayName ?? this.updatedDisplayName,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage,
        updatedDisplayName,
      ];
}
