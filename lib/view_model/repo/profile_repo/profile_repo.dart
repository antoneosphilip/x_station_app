import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:x_station_app/core/errors/faliuar.dart';
import 'package:x_station_app/model/profile_model/profile_model.dart';
import 'package:x_station_app/utility/database/network/dio-helper.dart';

import '../../../model/login_model/login_model.dart';
import '../../../model/signup_model/signup_model.dart';
import '../../../utility/database/network/end_points.dart';

abstract class ProfileRepo{
  Future<Either<Failure,ProfileModel>> getProfileData();
}

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<Either<Failure,ProfileModel>> getProfileData()
  async {
  try {
    Response response =
    await DioHelper.getData(url: EndPoint.signUpEndPoint);
    return Right(ProfileModel.fromJson(response.data));
  }
  on DioException catch (e) {
    return Left(ServerFailure.fromDioError(e));
  }
  catch (e) {
    return Left(FailureLocal(message: e.toString()));
  }
}

}

