import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/auth/logic/authentication_cubit.dart';
import 'package:flutter_bil_hikmah/feature/feedback/logic/feedback_cubit.dart';
import 'package:flutter_bil_hikmah/widget/button/default_button.dart';
import 'package:flutter_bil_hikmah/widget/field/default_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            DefaultTextField(
              hintText: "Subjek",
              labelText: "Subjek",
              controller: subjectController,
              inputType: TextInputType.text,
              validator: (String? text) {
                if (text?.isEmpty ?? true) {
                  return "Tolong isi subjek!";
                }
                return null;
              },
            ),
            const SizedBox(height: 12.0),
            DefaultTextField(
              hintText: "Tulis pesan anda disini",
              labelText: "Pesan",
              controller: messageController,
              inputType: TextInputType.multiline,
              maxLines: 8,
              validator: (String? text) {
                if (text?.isEmpty ?? true) {
                  return "Tolong isi pesan";
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            ButtonDefault(
              text: "Kirim",
              onPressed: () {
                if (!(formKey.currentState?.validate() ?? false)) {
                  return;
                }
                context.read<FeedbackCubit>().sendFeedbackSentry(
                      BlocProvider.of<AuthenticationCubit>(context)
                              .state
                              .user
                              ?.id ??
                          "Unknown ID",
                      BlocProvider.of<AuthenticationCubit>(context)
                              .state
                              .user
                              ?.userName ??
                          "Unknown Username",
                      BlocProvider.of<AuthenticationCubit>(context)
                              .state
                              .user
                              ?.email ??
                          "Unknown Email",
                      subjectController.text,
                      messageController.text,
                    );
              },
            )
          ],
        ),
      ),
    );
  }
}
