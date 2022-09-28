import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/model/quran_item.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/repository/quran_repository.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/logic/alquran_cubit.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/screen/section/al_quran_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exception/flutter_exception.dart';
import 'package:shimmer/shimmer.dart';

class AlQuranPage extends StatelessWidget {
  const AlQuranPage({this.needBack = false, Key? key}) : super(key: key);

  final bool needBack;

  static Route route({bool needBack = false}) => MaterialPageRoute(
      builder: (_) => AlQuranPage(
            needBack: needBack,
          ));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlquranCubit(
        QuranRepositoryImpl.create(),
      )..alQuranAll(),
      child: BlocConsumer<AlquranCubit, AlquranState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.exception!.errorMessage(context)),
                ),
              );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: "Al-Qur'an",
              needBack: needBack,
            ),
            body: state.status.isLoading || state.status.isFailure
                ? Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: Colors.grey[300]!,
                    child: AlQuranView(QuranItem.dummyQuranItemData),
                  )
                : AlQuranView(state.alQuranAll!),
          );
        },
      ),
    );
  }
}
