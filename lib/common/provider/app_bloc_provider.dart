import 'package:flutter_bil_hikmah/feature/splash/logic/cubit/init_app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProvider {
  static final List<BlocProvider> providerList = [
    BlocProvider<InitAppCubit>(
      create: (_) => InitAppCubit()..onInitiApp(),
    ),
  ];
}
