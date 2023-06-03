import 'package:api_exception/api_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/feature/admin/repository/admin_repository.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/repository/amalan_sunnah_item.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit(
    this._adminRepository,
  ) : super(const AdminState());

  final AdminRepository _adminRepository;

  Future<void> onAddAmalanSunnahItem(
    String title,
    String webURL,
  ) async {
    emit(state.copyWith(status: AdminStatus.loading));
    try {
      await _adminRepository.onAddAmalanSunnah(AmalanSunnahItem(
        title: title,
        webURL: webURL,
      ));
      emit(state.copyWith(status: AdminStatus.loaded));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: AdminStatus.error,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AdminStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
