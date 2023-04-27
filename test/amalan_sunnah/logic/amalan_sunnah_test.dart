import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/logic/amalan_sunnah_cubit.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/repository/amalan_sunnah_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'amalan_sunnah_test.mocks.dart';

@GenerateMocks([AmalanSunnahRepository])
void main() {
  late MockAmalanSunnahRepository mockAmalanSunnahRepository;
  setUp(() {
    mockAmalanSunnahRepository = MockAmalanSunnahRepository();
  });

  group(
    "Test Logic Amalan Sunah Cubit",
    () {
      blocTest<AmalanSunnahCubit, AmalanSunnahState>(
        "Get all data amalan sunnah",
        setUp: () {
          when(mockAmalanSunnahRepository.getAllAmalanSunnah()).thenAnswer(
            (realInvocation) async => [],
          );
        },
        build: () => AmalanSunnahCubit(mockAmalanSunnahRepository),
        act: (cubit) => cubit.getAllAmalanSunnah(),
        expect: () => [
          const AmalanSunnahState(status: AmalanSunnahStateStatus.loading),
          const AmalanSunnahState(
            amalanSunnahItem: [],
            status: AmalanSunnahStateStatus.loaded,
          ),
        ],
      );

      blocTest<AmalanSunnahCubit, AmalanSunnahState>(
        "Get all data amalan sunnah with Exception",
        setUp: () {
          when(mockAmalanSunnahRepository.getAllAmalanSunnah()).thenThrow(
            Exception("Error Amalan Sunnah"),
          );
        },
        build: () => AmalanSunnahCubit(mockAmalanSunnahRepository),
        act: (cubit) => cubit.getAllAmalanSunnah(),
        expect: () => [
          const AmalanSunnahState(status: AmalanSunnahStateStatus.loading),
          const AmalanSunnahState(
            status: AmalanSunnahStateStatus.error,
            errorMessage: "Exception: Error Amalan Sunnah",
          ),
        ],
      );
    },
  );
}
