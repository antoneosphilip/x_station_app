import 'package:either_dart/either.dart';
import 'package:x_station_app/model/notification_model/notification_model.dart';

import '../../../../core/errors/faliuar.dart';

abstract class NotificationRepo {
  Future<Either<Failure, NotificationModel>> getNotifications();
}
