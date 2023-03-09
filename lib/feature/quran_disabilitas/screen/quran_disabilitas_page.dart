import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/quran_disabilitas/logic/cubit/quran_disbailitas_cubit.dart';
import 'package:flutter_bil_hikmah/feature/quran_disabilitas/screen/quran_diasbilitas_view.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QurabDisabilitasPage extends StatelessWidget {
  const QurabDisabilitasPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (_) => const QurabDisabilitasPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranDisbailitasCubit()..initQuranDisbailtias(),
      child: BlocConsumer<QuranDisbailitasCubit, QuranDisbailitasState>(
        listener: (context, state) {
          if (state.status == QuranDisabilitasStateStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? "Unkown Error"),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: "Al-Qur'an Saku",
            ),
            body: state.status == QuranDisabilitasStateStatus.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ),
                  )
                : QuranDisabilitasView(state),
          );
        },
      ),
    );
  }
}
