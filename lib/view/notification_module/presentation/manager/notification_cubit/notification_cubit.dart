import 'dart:convert';
import 'dart:math' as math;

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../model/notification_model/notification_model.dart';
import '../../../../../model/notification_model/notification_model.dart' as noteModel;
import '../../../../../utility/database/network/pusher_helper.dart';
import '../../../domain/repositories/notification_repo.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._notificationRepo) : super(NotificationInitial());

  static NotificationCubit get(context) => BlocProvider.of(context);
  NotificationRepo _notificationRepo;
  noteModel.NotificationModel? notificationModel;

  Future<void> getNotification() async {
      emit(NotificationLoadingState());

    final response = await _notificationRepo.getNotifications();
    response.fold((l) {
      emit(NotificationErrorState(l.message));
    }, (r) {
      emit(NotificationSuccessState(r));
    });
  }

}
