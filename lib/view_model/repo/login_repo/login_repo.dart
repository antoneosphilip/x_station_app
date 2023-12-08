import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:x_station_app/core/errors/faliuar.dart';
import 'package:x_station_app/utility/database/network/dio-helper.dart';

import '../../../model/login_model/login_model.dart';
import '../../../utility/database/network/end_points.dart';

abstract class LoginRepo{
  Future<Either<Failure,LoginModel>> login(String email, String  password);
}

class LoginRepoImpl implements LoginRepo {
  @override
  Future<Either<Failure,LoginModel>> login(String email, String password) async {
  try {
    Response response =
    await DioHelper.postData(url: EndPoint.signInEndPoint, data: {
      'email': email,
      'password': password,
    });
    return Right(LoginModel.fromJson(response.data));
  }
  on DioException catch (e) {
    return Left(ServerFailure.fromDioError(e));
  }
  catch (e) {
    return Left(FailureLocal(message: e.toString()));
  }
}

}

