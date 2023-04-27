import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'feedback_state.dart';

class FeedbackCubit extends Cubit<FeedbackState> {
  FeedbackCubit() : super(const FeedbackState());

  Future<bool> sendFeedbackSentry(
    String userID,
    String name,
    String email,
    String title,
    String comments,
  ) async {
    emit(state.copyWith(status: FeedBackStateStatus.loading));
    try {
      final SentryId sentryID = await Sentry.captureMessage(
        title,
        withScope: (scope) {
          scope.setUser(SentryUser(id: userID));
        },
      );
      final userFeedback = SentryUserFeedback(
        eventId: sentryID,
        comments: comments,
        email: email,
        name: name,
      );
      await Sentry.captureUserFeedback(userFeedback);
      Timer(
        const Duration(milliseconds: 1800),
        () {
          emit(state.copyWith(status: FeedBackStateStatus.success));
        },
      );
      return true;
    } catch (e) {
      emit(state.copyWith(
        status: FeedBackStateStatus.error,
        errorMessage: e.toString(),
      ));
      return false;
    }
  }
}
