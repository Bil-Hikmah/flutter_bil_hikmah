import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/logic/cubit/sign_language_cubit.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/screen/section/sign_language_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bil_hikmah/widget/misc/default_circular_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignLanguagePage extends StatelessWidget {
  const SignLanguagePage({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (_) => const SignLanguagePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignLanguageCubit()..onInitSignLanguage(),
      child: BlocConsumer<SignLanguageCubit, SignLanguageState>(
        listener: (context, state) {
          if (state.status == SignLanguageStateStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: "Bahasa Isyarat",
            ),
            body: state.status == SignLanguageStateStatus.loading
                ? const Center(
                    child: DefaultCircularProgress(),
                  )
                : SignLanguageView(state),
          );
        },
      ),
    );
  }
}
