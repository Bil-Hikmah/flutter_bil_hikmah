import 'dart:async';

import 'package:api_exception/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/model/adhan_schedule.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/repository/home_repository.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : _homeRepository = HomeRepositoryImpl.create(),
        super(const HomeState());

  final HomeRepository _homeRepository;
  DateTime current = DateTime.now();

  late StreamSubscription<DateTime> streamedTime;

  @override
  close() async {
    streamedTime.cancel();
    return super.close();
  }

  Stream<DateTime> streamedTimes() {
    return Stream.periodic(
      const Duration(seconds: 1),
      (i) {
        current = current.add(const Duration(seconds: 1));
        return current;
      },
    );
  }

  Future<void> onInit() async {
    emit(state.copyWith(
      status: HomeStateStatus.loading,
      streamedTime: current,
    ));
    try {
      streamedTime = streamedTimes().listen((event) {
        emit(state.copyWith(
          streamedTime: event,
        ));
      });
      final adhanScheduleResponse = await _homeRepository.getAdhanSchedule();
      final smallDakwahResponse = await _homeRepository.onGetVideoDakwah();
      emit(state.copyWith(
        adhanSchedule: adhanScheduleResponse,
        smallDakwah: smallDakwahResponse,
        status: HomeStateStatus.loaded,
      ));
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
