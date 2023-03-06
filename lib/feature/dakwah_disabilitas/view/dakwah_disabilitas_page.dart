import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/dakwah_disabilitas/logic/dakwah_disabilitas_cubit.dart';
import 'package:flutter_bil_hikmah/feature/dakwah_disabilitas/view/dakwah_disabilitas_view.dart';

import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/video_dakwah_shimmer.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/video_dakwah_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class DakwahDisabilitasPage extends StatelessWidget {
  const DakwahDisabilitasPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (_) => const DakwahDisabilitasPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DakwahDisabilitasCubit()..onInitDakwahDisbailitas(),
      child: BlocConsumer<DakwahDisabilitasCubit, DakwahDisabilitasState>(
        listener: (context, state) {
          if (state.status == DakwahDisabilitasStateStatus.failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.errorMessage),
                ),
              );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: defaultAppBar(context: context, title: "Video Dakwah"),
              backgroundColor: Colors.white,
              body: state.status == DakwahDisabilitasStateStatus.loading ||
                      state.status == DakwahDisabilitasStateStatus.failure
                  ? Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey[300]!,
                      child: const VideoDakwahShimmer(),
                    )
                  : const DawahDisabilitasView(),
            ),
          );
        },
      ),
    );
  }
}
