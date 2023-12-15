import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:x_station_app/core/errors/faliuar.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/utility/database/network/dio-helper.dart';

import '../../../model/category_selectmenu_model/category_selectmenu_model.dart';
import '../../../model/login_model/login_model.dart';
import '../../../utility/database/network/end_points.dart';

abstract class CategoryRepo{
  Future<Either<Failure,CategoryModel>> getCategoryData();
  Future<Either<Failure,CategorySelectMenuModel>> getCategorySelectMenuData();


}

class CategoryRepoImpl implements CategoryRepo {
  @override
  Future<Either<Failure,CategoryModel>> getCategoryData() async {
  try {
    Response response =
    await DioHelper.getData(url: EndPoint.category);

    return Right(CategoryModel.fromJson(response.data));
  }
  on DioException catch (e) {
    return Left(ServerFailure.fromDioError(e));
  }
  catch (e) {
    return Left(FailureLocal(message: e.toString()));
  }
}


  Future<Either<Failure,CategorySelectMenuModel>> getCategorySelectMenuData() async {
    try {
      Response response =
      await DioHelper.getData(url: EndPoint.getCategorySelectMenu);

      return Right(CategorySelectMenuModel.fromJson(response.data));
    }
    on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
    catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

}

