import 'package:x_station_app/model/login_model/login_model.dart';

import '../../../model/notification_model/notification_model.dart';

abstract class GetNotificationStates{}
class GetNotificationInitialState extends GetNotificationStates{}
class GetNotificationLoadingState extends GetNotificationStates{}
class GetNotificationSuccessState extends GetNotificationStates{
 NotificationModel notificationModel;
GetNotificationSuccessState(this.notificationModel);
}
class GetNotificationErrorState extends GetNotificationStates{
 final String err;

 GetNotificationErrorState(this.err);

}
class ChangeVisibilityPassword extends GetNotificationStates{}
