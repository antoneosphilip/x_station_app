import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:x_station_app/core/errors/faliuar.dart';
import 'package:x_station_app/model/add_favorite_model/add_favorite_model.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/utility/database/network/dio-helper.dart';

import '../../../model/category_selectmenu_model/category_selectmenu_model.dart';
import '../../../model/login_model/login_model.dart';
import '../../../utility/database/network/end_points.dart';

abstract class AddFavoriteRepo{
  Future<Either<Failure,AddFavoriteModel>> addFavorite({required id});
  Future<Either<Failure,AddFavoriteModel>> getFavorite();


}

class AddFavoriteRepoImpl implements AddFavoriteRepo {
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


  @override
  Future<Either<Failure,AddFavoriteModel>> getFavorite() async {
    try {
      Response response =
      await DioHelper.getData(
        url:EndPoint.getFavorite
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

