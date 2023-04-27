import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/logic/amalan_sunnah_cubit.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/repository/amalan_sunnah_repository.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/screen/section/amalan_sunnah_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmalanSunnah extends StatelessWidget {
  const AmalanSunnah({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => const AmalanSunnah());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AmalanSunnahCubit(AmalanSunnahRepositoryImpl.create())
            ..getAllAmalanSunnah(),
      child: BlocConsumer<AmalanSunnahCubit, AmalanSunnahState>(
        listener: (context, state) {
          if (state.status == AmalanSunnahStateStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: "Amalan Sunnah",
            ),
            body: state.status == AmalanSunnahStateStatus.loading ||
                    state.status == AmalanSunnahStateStatus.error
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : AmalanSunnahView(state),
          );
        },
      ),
    );
  }
}
