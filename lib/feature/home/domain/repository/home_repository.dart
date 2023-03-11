import 'package:api_exception/api_exception.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/model/adhan_schedule.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/service/home_service.dart';

abstract class HomeRepository {
  Future<bool> onGetHomeData();
  Future<AdhanSchedule> getAdhanSchedule();
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
  Future<AdhanSchedule> getAdhanSchedule() async {
    try {
      return await _homeService.getAdhanSchedule();
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
