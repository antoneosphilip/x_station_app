import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:x_station_app/core/errors/faliuar.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/utility/database/network/dio-helper.dart';

import '../../../model/login_model/login_model.dart';
import '../../../model/technical_model/technical_model.dart';
import '../../../utility/database/network/end_points.dart';

abstract class TechnicalRepo{
  Future<Either<Failure,TechnicalListModel>> getTechnicalList({required id});
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

}

