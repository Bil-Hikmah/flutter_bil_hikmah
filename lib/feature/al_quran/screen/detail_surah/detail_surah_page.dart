import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/repository/quran_repository.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/logic/alquran_cubit.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/screen/detail_surah/detail_surah_view.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exception/flutter_exception.dart';

class DetailSurahPage extends StatelessWidget {
  const DetailSurahPage(this.surahNumber, {Key? key}) : super(key: key);

  final int surahNumber;

  static Route route(int surahNumber) {
    return MaterialPageRoute(
      builder: (_) => DetailSurahPage(
        surahNumber,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlquranCubit(
        QuranRepositoryImpl.create(),
      )..surahDetail(surahNumber),
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
              title: "Detail Surah",
            ),
            body: state.status.isLoading || state.status.isFailure
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ),
                  )
                : DetailSurahView(state.surahDetail!.data),
          );
        },
      ),
    );
  }
}
