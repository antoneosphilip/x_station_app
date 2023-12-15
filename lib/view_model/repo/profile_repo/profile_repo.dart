import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:x_station_app/core/errors/faliuar.dart';
import 'package:x_station_app/model/log_out_model/log_out_model.dart';
import 'package:x_station_app/model/profile_model/profile_model.dart';
import 'package:x_station_app/utility/database/network/dio-helper.dart';

import '../../../model/chnage_password_model/chnage_password_model.dart';
import '../../../model/login_model/login_model.dart';
import '../../../model/signup_model/signup_model.dart';
import '../../../model/update_profile_model/update_prfile_model.dart';
import '../../../utility/database/local/cach_data.dart';
import '../../../utility/database/network/end_points.dart';

abstract class ProfileRepo{
  Future<Either<Failure,ProfileModel>> getProfileData();
  Future<Either<Failure,UpdateProfileModel>> updateProfileData( name, address, phone, email);
  Future<Either<Failure,LogOutModel>> logOut();
  Future<Either<Failure,ChangePasswordModel>> changePassword(oldPassword,newPassword,confirmPassword);


}
/////////////get profile data///////////////
class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<Either<Failure,ProfileModel>> getProfileData()
  async {
  try {
    Response response =
    await DioHelper.getData(url: EndPoint.profileEndPoint,
        token:
        CachingDataManager.instance.getLoginModel().data!.token

    );
    return Right(ProfileModel.fromJson(response.data));
  }
  on DioException catch (e) {
    return Left(ServerFailure.fromDioError(e));
  }
  catch (e) {
    return Left(FailureLocal(message: e.toString()));
  }
}



/////////////update profile data//////////////
  @override
  Future<Either<Failure,UpdateProfileModel>> updateProfileData( name, address, phone, email)
  async {
    try {
      Response response =
      await DioHelper.postData(url: EndPoint.profileEndPoint,
          token: CachingDataManager.instance.getLoginModel().data!.token,
        data: {
        'name':name,
          'address':address,
          'phone_number':phone,
          'email':email,
        }

      );
      return Right(UpdateProfileModel.fromJson(response.data));
    }
    on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
    catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }



  /////////////log out//////////////
  @override
  Future<Either<Failure,LogOutModel>> logOut()
  async {
    try {
      Response response =
      await DioHelper.postData(url: EndPoint.logOutEndPoint,
          token: CachingDataManager.instance.getLoginModel().data!.token, data: {

        },
      );
      return Right(LogOutModel.fromJson(response.data));
    }
    on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
    catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  /////////////change password//////////////
  @override
  Future<Either<Failure,ChangePasswordModel>> changePassword( oldPassword, newPassword, confirmPassword,)
  async {
    try {
      Response response =
      await DioHelper.putData(url: EndPoint.profileEndPoint,
          token: CachingDataManager.instance.getLoginModel().data!.token,
          data: {
            'old_password':oldPassword,
            'new_password':newPassword,
            'confirm_password':confirmPassword,
          }

      );
      return Right(ChangePasswordModel.fromJson(response.data));
    }
    on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
    catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }



}

