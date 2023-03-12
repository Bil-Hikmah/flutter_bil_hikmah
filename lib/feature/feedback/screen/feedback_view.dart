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
    return Form(
      key: formKey,
      child: Column(
        children: [
          DefaultTextField(
            hintText: "Subject",
            controller: subjectController,
            inputType: TextInputType.text,
            validator: (String? text) {
              if (text?.isEmpty ?? true) {
                return "Tolong isi subject";
              }
              return null;
            },
          ),
          const SizedBox(height: 8.0),
          DefaultTextField(
            hintText: "Pesan",
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
    );
  }
}
