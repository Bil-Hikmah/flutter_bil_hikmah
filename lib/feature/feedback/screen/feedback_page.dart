import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/feedback/logic/feedback_cubit.dart';
import 'package:flutter_bil_hikmah/feature/feedback/screen/feedback_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (context) => const FeedbackPage(),
        settings: const RouteSettings(name: "/feedback"),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedbackCubit(),
      child: ProgressHUD(
        child: BlocListener<FeedbackCubit, FeedbackState>(
          listener: (context, state) {
            if (state.status == FeedBackStateStatus.loading) {
              ProgressHUD.of(context)?.showWithText("Loading");
            } else {
              ProgressHUD.of(context)?.dismiss();
            }
            if (state.status == FeedBackStateStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Success Send Feedback"),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.of(context).pop();
            }
            if (state.status == FeedBackStateStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: "User Feedback",
            ),
            body: const FeedbackView(),
          ),
        ),
      ),
    );
  }
}
