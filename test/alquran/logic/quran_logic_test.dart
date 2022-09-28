import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/repository/quran_repository.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/logic/alquran_cubit.dart';
import 'package:flutter_exception/flutter_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'quran_logic_test.mocks.dart';

@GenerateMocks([QuranRepository])
void main() {
  late MockQuranRepository mockQuranRepository;
  setUp(() {
    mockQuranRepository = MockQuranRepository();
  });

  group("Test logic AlQuran Cubit", () {
    blocTest<AlquranCubit, AlquranState>(
      "Get all surah in Al-Qur'an",
      setUp: () {
        when(mockQuranRepository.quranAll()).thenAnswer(
          (_) async => [],
        );
      },
      build: () => AlquranCubit(mockQuranRepository),
      act: (cubit) => cubit.alQuranAll(),
      expect: () => [
        const AlquranState(status: AlquranStatus.loading),
        const AlquranState(
          status: AlquranStatus.success,
          alQuranAll: [],
        ),
      ],
    );

    blocTest<AlquranCubit, AlquranState>(
      "Exception when get all surah in Al-Qur'an",
      setUp: () {
        when(mockQuranRepository.quranAll()).thenThrow(
          const UnknownException(),
        );
      },
      build: () => AlquranCubit(mockQuranRepository),
      act: (cubit) => cubit.alQuranAll(),
      expect: () => [
        const AlquranState(status: AlquranStatus.loading),
        const AlquranState(
          status: AlquranStatus.failure,
          exception: UnknownException(),
        ),
      ],
    );
  });
}
