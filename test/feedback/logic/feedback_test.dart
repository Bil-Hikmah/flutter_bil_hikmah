import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bil_hikmah/feature/feedback/logic/feedback_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late FeedbackCubit feedbackCubit;
  setUp(() {
    feedbackCubit = FeedbackCubit();
  });

  group(
    "Test Feedback Logic",
    () {
      test(
        "Test send sentry feedback",
        () async {
          final sendFeedbackSentry = await feedbackCubit.sendFeedbackSentry(
            "userID",
            "name",
            "email@gmail.com",
            "title",
            "comments",
          );
          expect(sendFeedbackSentry, false);
        },
      );
    },
  );
}
