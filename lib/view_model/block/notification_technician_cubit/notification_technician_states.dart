import 'package:x_station_app/model/login_model/login_model.dart';

import '../../../model/notification_Technician_model/notification_Technician_model.dart';
import '../../../model/notification_model/notification_model.dart';

abstract class GetNotificationTechnicianStates{}
class GetNotificationTechnicianInitialState extends GetNotificationTechnicianStates{}
class GetNotificationTechnicianLoadingState extends GetNotificationTechnicianStates{}
class GetNotificationTechnicianSuccessState extends GetNotificationTechnicianStates{
 NotificationTechnicianModel notificationTechnicianModel;
GetNotificationTechnicianSuccessState(this.notificationTechnicianModel);
}
class GetNotificationTechnicianErrorState extends GetNotificationTechnicianStates{
 final String err;

 GetNotificationTechnicianErrorState(this.err);

}
class ChangeVisibilityPassword extends GetNotificationTechnicianStates{}
