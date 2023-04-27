import 'dart:async';

import 'package:api_exception/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/model/adhan_schedule.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/repository/city_adhan_item.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/repository/home_repository.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(const HomeState());

  final HomeRepository _homeRepository;
  DateTime current = DateTime.now();

  StreamSubscription<DateTime>? streamedTime;

  @override
  close() async {
    if (streamedTime != null) {
      streamedTime!.cancel();
    }
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
      streamedTimes().listen((event) {
        emit(state.copyWith(
          streamedTime: event,
        ));
      });
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? cityAdhan = prefs.getString('cityAdhan');
      if (cityAdhan?.isEmpty ?? true) {
        prefs.setString('cityAdhan', cityAdhanItem[0]);
        cityAdhan = cityAdhanItem[0];
      }
      final adhanScheduleResponse =
          await _homeRepository.getAdhanSchedule(cityAdhan ?? state.cityAdhan);
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

  Future<void> onChangeAdhanCity(String cityAdhanChangeItem) async {
    emit(state.copyWith(status: HomeStateStatus.loadingChangeCity));
    try {
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('cityAdhan', cityAdhanChangeItem);
      final adhanScheduleResponse =
          await _homeRepository.getAdhanSchedule(cityAdhanChangeItem);
      emit(
        state.copyWith(
          adhanSchedule: adhanScheduleResponse,
          cityAdhan: cityAdhanChangeItem,
          status: HomeStateStatus.loadedChangeCity,
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
