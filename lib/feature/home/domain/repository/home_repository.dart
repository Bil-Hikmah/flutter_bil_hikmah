import 'package:api_exception/api_exception.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/model/adhan_schedule.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/service/home_service.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_models.dart';

abstract class HomeRepository {
  Future<bool> onGetHomeData();
  Future<AdhanSchedule> getAdhanSchedule(String city);
  Future<List<VideoDakwahModels>> onGetVideoDakwah();
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeService _homeService;

  HomeRepositoryImpl(this._homeService);

  @override
  Future<bool> onGetHomeData() async {
    try {
      return await _homeService.getHomeData();
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<AdhanSchedule> getAdhanSchedule(String city) async {
    try {
      return await _homeService.getAdhanSchedule(city);
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<List<VideoDakwahModels>> onGetVideoDakwah() {
    try {
      return _homeService.onGetVideoDakwah();
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  factory HomeRepositoryImpl.create() {
    return HomeRepositoryImpl(
      HomeServiceImpl.create(),
    );
  }
}
