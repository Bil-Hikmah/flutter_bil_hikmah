import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/feature/profile/domain/repository/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  final ProfileRepository repository = ProfileRepositoryImpl.create();

  Future<void> updateDisplayName(String name, String? documentID) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      final response = await repository.updateProfileName(name, documentID);
      if (response) {
        emit(state.copyWith(
          updatedDisplayName: name,
          status: ProfileStatus.successUpdateDisplayName,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: ProfileStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
