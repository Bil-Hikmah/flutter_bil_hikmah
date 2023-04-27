import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/model/adhan_schedule.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/repository/home_repository.dart';
import 'package:flutter_bil_hikmah/feature/home/logic/cubit/home_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late MockHomeRepository homeRepository;

  setUp(() async {
    homeRepository = MockHomeRepository();
  });

  group(
    "Test logic home repository",
    () {
      blocTest<HomeCubit, HomeState>(
        "Change adhan location",
        setUp: () {
          when(homeRepository.getAdhanSchedule("yogyakarta"))
              .thenAnswer((realInvocation) async => AdhanSchedule(
                    imsyak: "example",
                    shubuh: "example",
                    dzuhur: "example",
                    tanggal: DateTime(1999),
                    terbit: "example",
                    magrib: "example",
                    isya: "example",
                    dhuha: "example",
                    ashr: "example",
                  ));
        },
        build: () => HomeCubit(homeRepository),
        act: (cubit) => cubit.onChangeAdhanCity("yogyakarta"),
        expect: () => [
          const HomeState(status: HomeStateStatus.loadingChangeCity),
          HomeState(
            status: HomeStateStatus.loadedChangeCity,
            adhanSchedule: AdhanSchedule(
              imsyak: "example",
              shubuh: "example",
              dzuhur: "example",
              tanggal: DateTime(1999),
              terbit: "example",
              magrib: "example",
              isya: "example",
              dhuha: "example",
              ashr: "example",
            ),
            cityAdhan: "yogyakarta",
          ),
        ],
      );
    },
  );
}
