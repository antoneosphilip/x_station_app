import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:x_station_app/utility/database/network/end_points.dart';

import '../../../core/errors/faliuar.dart';
import '../../../model/forget_password_model/forget_password_model.dart';
import '../../../utility/database/network/dio-helper.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure,ForgetPasswordModel>> forgetPassword({required email});
  Future<Either<Failure,ForgetPasswordModel>> checkCode({required code,required email});
  Future<Either<Failure,ForgetPasswordModel>> resetPassword({required password,required confirmPassword,required email});
}
class ForgetPasswordRepoImpl implements ForgetPasswordRepo{
  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword({required email}) async {
    try
    {
      Response response =await DioHelper.postData(
          url: EndPoint.forgetPasswordEndPoint,
          data: {
            'email':email,
          });
      return Right(ForgetPasswordModel.fromJson(response.data));
    }on DioException catch(e)
    {
      debugPrint("-------------Response Data----------------");
      debugPrint(e.response!.data.toString());
      debugPrint("-------------Response Data----------------");
      return Left(ServerFailure.fromDioError(e));
    }
    catch(e)
    {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ForgetPasswordModel>> checkCode({required code,required email}) async {
    try
    {
      Response response =await DioHelper.postData(
          url: EndPoint.checkCode,
          data: {
            'token':code,
            'email':email,
          });
      return Right(ForgetPasswordModel.fromJson(response.data));
    }on DioException catch(e)
    {
      debugPrint("-------------Response Data----------------");
      debugPrint(e.response!.data.toString());
      debugPrint("-------------Response Data----------------");
      return Left(ServerFailure.fromDioError(e));
    }
    catch(e)
    {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ForgetPasswordModel>> resetPassword({required password, required confirmPassword,required email}) async {
    try
    {
      Response response =await DioHelper.postData(
          url: EndPoint.resetPassword,
          data: {
            'password':password,
            'password_confirmation':confirmPassword,
            'email':email
          });
      return Right(ForgetPasswordModel.fromJson(response.data));
    }on DioException catch(e)
    {
      debugPrint("-------------Response Data----------------");
      debugPrint(e.response!.data.toString());
      debugPrint("-------------Response Data----------------");
      return Left(ServerFailure.fromDioError(e));
    }
    catch(e)
    {
      return Left(FailureLocal(message: e.toString()));
    }
  }

}