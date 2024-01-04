import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:x_station_app/core/errors/faliuar.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/utility/database/network/dio-helper.dart';

import '../../../model/add_favorite_model/add_favorite_model.dart';
import '../../../model/get_fav_model/get_fav_model.dart';
import '../../../model/login_model/login_model.dart';
import '../../../model/technical_model/technical_model.dart';
import '../../../utility/database/network/end_points.dart';

abstract class TechnicalRepo{
  Future<Either<Failure,TechnicalListModel>> getTechnicalList({required id});
  Future<Either<Failure,GetFavoriteModel>> getFavorite();
  Future<Either<Failure,AddFavoriteModel>> addFavorite({required id});


}

class TechnicalRepoImpl implements TechnicalRepo {
  @override
  Future<Either<Failure,TechnicalListModel>> getTechnicalList({required id}) async {
  try {
    Response response =
    await DioHelper.getData(url: '/categories/${id}/technicals');

    return Right(TechnicalListModel.fromJson(response.data));
  }
  on DioException catch (e) {
    return Left(ServerFailure.fromDioError(e));
  }
  catch (e) {
    return Left(FailureLocal(message: e.toString()));
  }
}

  @override
  Future<Either<Failure,GetFavoriteModel>> getFavorite() async {
    try {
      Response response =
      await DioHelper.getData(
          url:EndPoint.getFavorite
      );

      return Right(GetFavoriteModel.fromJson(response.data));
    }
    on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
    catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
  @override
  Future<Either<Failure,AddFavoriteModel>> addFavorite({required id}) async {
    try {
      Response response =
      await DioHelper.getData(
        url:
        '/users/${id}/favorite',
      );

      return Right(AddFavoriteModel.fromJson(response.data));
    }
    on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
    catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

}

