import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/repository/home_repository.dart';
import 'package:flutter_bil_hikmah/feature/home/logic/cubit/home_cubit.dart';
import 'package:flutter_bil_hikmah/feature/home/screen/section/home_view.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Example for using Cubit to manage state in a Flutter app.
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepositoryImpl.create())..onInit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status.isError) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    state.exception?.message ?? 'Unknown error',
                    style: AppTextStyle.textSmall,
                  ),
                ),
              );
          }
        },
        builder: (context, state) {
          return state.status.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryDark,
                  ),
                )
              : HomeView(state);
        },
      ),
    );
  }
}
