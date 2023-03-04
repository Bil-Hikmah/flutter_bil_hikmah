import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/poster/logic/poster_cubit.dart';
import 'package:flutter_bil_hikmah/feature/poster/screen/section/poster_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bil_hikmah/widget/misc/default_circular_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PosterPage extends StatelessWidget {
  const PosterPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(builder: (_) => const PosterPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PosterCubit()..onGetPoster(),
      child: BlocConsumer<PosterCubit, PosterState>(
        listener: (context, state) {
          if (state.status == PosterStateStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  state.errorMessage ?? "",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: "Poster",
            ),
            backgroundColor: Colors.white,
            body: state.status == PosterStateStatus.loading
                ? const Center(child: DefaultCircularProgress())
                : PosterView(state),
          );
        },
      ),
    );
  }
}
