import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:x_station_app/core/errors/faliuar.dart';
import 'package:x_station_app/model/notification_model/notification_model.dart';
import 'package:x_station_app/utility/database/network/dio-helper.dart';

import '../../../model/login_model/login_model.dart';
import '../../../utility/database/network/end_points.dart';

abstract class GetNotificationRepo{
  Future<Either<Failure,NotificationModel>> getNotification();
}

class GetNotificationRepoImpl implements GetNotificationRepo {


  @override
  Future<Either<Failure,NotificationModel>> getNotification() async {
  try {
    Response response =
    await DioHelper.getData(url: EndPoint.notificationEndPoint);
    return Right(NotificationModel.fromJson(response.data));
  }
  on DioException catch (e) {
    return Left(ServerFailure.fromDioError(e));
  }
  catch (e) {
    return Left(FailureLocal(message: e.toString()));
  }
}

}

