import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import 'package:x_station_app/utility/database/network/end_points.dart';

import '../../../../../core/errors/faliuar.dart';
import '../../../../../model/notification_model/notification_model.dart';
import '../../../../../utility/database/network/dio-helper.dart';
import '../../../domain/repositories/notification_repo.dart';

class NotificationRepoImpl extends NotificationRepo {
  @override
  Future<Either<Failure, NotificationModel>> getNotifications() async {
    try {
      Response response = await DioHelper.getData(
          url: EndPoint.notificationEndPoint,);
      return Right(NotificationModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}
