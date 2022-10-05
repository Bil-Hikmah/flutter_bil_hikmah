import 'package:api_exception/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final HomeRepository _homeRepository = HomeRepositoryImpl.create();

  Future<void> onInit() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      /// Emit the data from response to state of cubit (HomeState)
      final response = _homeRepository.onGetHomeData();
      emit(
        state.copyWith(
          status: HomeStateStatus.loaded,
          // response: response, => for example, if you want to emit the response to state of cubit (HomeState)
        ),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: HomeStateStatus.error,
          exception: e,
        ),
      );
    }
  }
}
