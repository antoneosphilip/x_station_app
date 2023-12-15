import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:x_station_app/core/errors/faliuar.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/utility/database/network/dio-helper.dart';

import '../../../model/login_model/login_model.dart';
import '../../../model/sign_up_techinican_model/sign_up_technicain_model.dart';
import '../../../model/signup_model/signup_model.dart';
import '../../../utility/database/network/end_points.dart';

abstract class SignUpRepo{
  Future<Either<Failure,LoginModel>> signUp(
     String fullName,
     String  email,
     String  phone,
     String  password,
     String  rePassword,
     String  address,
     String type,
      );

  Future<Either<Failure,LoginModel>> signUpTechnical(
      String fullName,
      String  email,
      String  phone,
      String  password,
      String  rePassword,
      String  address,
      String type,
      String categoryId,
      String nationalId,
      String experienceYears,



      );
}

class SignUpRepoImpl implements SignUpRepo {
  @override
  Future<Either<Failure,LoginModel>> signUp(
      String? fullName,
      String?  email,
      String ? phone,
      String ? password,
      String ? rePassword,
      String ? address,
      String ?type,
      ) async {
  try {
    Response response =
    await DioHelper.postData(url: EndPoint.signUpEndPoint, data: {
      'name': fullName,
      'password': password,
      'email': email,
      'address':address,
      "phone_number":phone,
      "type":type==TextManager.client?"customer":type== TextManager.technical?"technical":"company",
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

  @override
  Future<Either<Failure,LoginModel>> signUpTechnical(
      String? fullName,
      String?  email,
      String ? phone,
      String ? password,
      String ? rePassword,
      String ? address,
      String ?type,
      String? categoryId,
      String ?nationalId,
      String ?experienceYears,

      ) async {
    try {
      Response response =
      await DioHelper.postData(url: EndPoint.signUpTechnicalEndPoint, data: {
        'name': fullName,
        'password': password,
        'email': email,
        'address':address,
        "phone_number":phone,
        "type":type==TextManager.client?"customer":type== TextManager.technical?"technical":"company",
        "category_id":2,
        "national_id":nationalId,
        "experience_years":4,

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

