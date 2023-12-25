import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:x_station_app/core/errors/faliuar.dart';
import 'package:x_station_app/model/log_out_model/log_out_model.dart';
import 'package:x_station_app/model/order_list_model/order_list_model.dart';
import 'package:x_station_app/model/order_list_model/order_list_model.dart';
import 'package:x_station_app/model/order_list_model/order_list_model.dart';
import 'package:x_station_app/model/profile_model/profile_model.dart';
import 'package:x_station_app/utility/database/network/dio-helper.dart';

import '../../../model/chnage_password_model/chnage_password_model.dart';
import '../../../model/login_model/login_model.dart';
import '../../../model/search_model/search_model.dart';
import '../../../model/signup_model/signup_model.dart';
import '../../../model/update_profile_model/update_prfile_model.dart';
import '../../../utility/database/local/cach_data.dart';
import '../../../utility/database/network/end_points.dart';

abstract class OrderListRepo{
  Future<Either<Failure,OrderListModel>> getOrderList();

}
/////////////get profile data///////////////
class OrderListRepoImpl implements OrderListRepo {
  @override
  Future<Either<Failure,OrderListModel>> getOrderList()
  async {
  try {
    Response response =
    await DioHelper.getData(url:EndPoint.allAccepted,
    );
    return Right(OrderListModel.fromJson(response.data));
  }
  on DioException catch (e) {
    return Left(ServerFailure.fromDioError(e));
  }
  catch (e) {
    return Left(FailureLocal(message: e.toString()));
  }
}


}

