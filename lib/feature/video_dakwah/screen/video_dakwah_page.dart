import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/logic/video_dakwah_cubit.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/video_dakwah_shimmer.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/video_dakwah_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class VideoDakwahPage extends StatelessWidget {
  const VideoDakwahPage({this.needAppBar = false, Key? key}) : super(key: key);

  final bool needAppBar;

  static Route route({bool needAppBar = false}) => MaterialPageRoute(
        builder: (_) => VideoDakwahPage(
          needAppBar: needAppBar,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoDakwahCubit()..onInit(),
      child: BlocConsumer<VideoDakwahCubit, VideoDakwahState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.exception?.message ?? 'Unknown Error'),
                ),
              );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: needAppBar
                  ? defaultAppBar(context: context, title: "Video Dakwah")
                  : null,
              backgroundColor: Colors.white,
              body: state.status.isLoading || state.status.isFailure
                  ? Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey[300]!,
                      child: const VideoDakwahShimmer(),
                    )
                  : VideoDakwahView(
                      needAppBar ? false : true,
                      state.videoGenreData!,
                    ),
            ),
          );
        },
      ),
    );
  }
}
