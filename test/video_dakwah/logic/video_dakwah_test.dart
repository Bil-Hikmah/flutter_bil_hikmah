import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/logic/video_dakwah_cubit.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'video_dakwah_test.mocks.dart';

@GenerateMocks([VideoDakwahRepository])
void main() {
  late MockVideoDakwahRepository videoDakwahRepository;

  setUp(() {
    videoDakwahRepository = MockVideoDakwahRepository();
  });

  group(
    "Test Logic Video Dakwah",
    () {
      blocTest<VideoDakwahCubit, VideoDakwahState>(
        "Get all video dakwah",
        setUp: () {
          when(videoDakwahRepository.onGetVideoDakwah())
              .thenAnswer((realInvocation) async => []);
        },
        build: () => VideoDakwahCubit(videoDakwahRepository),
        act: (cubit) => cubit.onInit(),
        expect: () => [
          const VideoDakwahState(status: VideoDakwahStatus.loading),
          const VideoDakwahState(
            status: VideoDakwahStatus.success,
            videoDakwahItem: [],
            videoDakwahTemp: [],
          ),
        ],
      );

      blocTest<VideoDakwahCubit, VideoDakwahState>(
        "Get video dakwah with genre",
        setUp: () {
          when(videoDakwahRepository.onGetVideoDakwahWithGenre("tuli"))
              .thenAnswer((realInvocation) async => []);
        },
        build: () => VideoDakwahCubit(videoDakwahRepository),
        act: (cubit) => cubit.onGetVideoWithGenre("tuli"),
        expect: () => [
          const VideoDakwahState(status: VideoDakwahStatus.loadingGenre),
          const VideoDakwahState(
            status: VideoDakwahStatus.success,
            videoDakwahItem: [],
          ),
        ],
      );

      blocTest<VideoDakwahCubit, VideoDakwahState>(
        "Get video dakwah with keywoard",
        setUp: () {},
        build: () => VideoDakwahCubit(videoDakwahRepository),
        act: (cubit) => cubit.onGetVideoWithSearch("ramadhan"),
        expect: () => [
          const VideoDakwahState(status: VideoDakwahStatus.loadingSearch),
          const VideoDakwahState(
            status: VideoDakwahStatus.success,
            videoDakwahItem: [],
          ),
        ],
      );
    },
  );
}
