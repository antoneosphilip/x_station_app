part of 'notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationSuccessState extends NotificationState {
  final noteModel.NotificationModel notificationModel;

  NotificationSuccessState(this.notificationModel);
}

class NotificationErrorState extends NotificationState {
  final String error;

  NotificationErrorState(this.error);
}
