import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:x_station_app/core/errors/faliuar.dart';
import 'package:x_station_app/model/get_post_model/get_post_model.dart';
import 'package:x_station_app/utility/database/network/dio-helper.dart';

import '../../../model/create_post_model/create_post_model.dart';
import '../../../model/login_model/login_model.dart';
import '../../../utility/database/network/end_points.dart';

abstract class PostsRepo{
  Future<Either<Failure,CreatePostModel>> createPost({required dynamic data});
  Future<Either<Failure,GetPostModel>> getPost();

}

class PostsRepoImpl implements PostsRepo {
  @override
  Future<Either<Failure,CreatePostModel>> createPost({required dynamic data}) async {
    try {
      Response response =
      await DioHelper.postData(url: EndPoint.posts, data: data);
      return Right(CreatePostModel.fromJson(response.data));
    }
    on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
    catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }


  @override
  Future<Either<Failure,GetPostModel>> getPost() async {
    try {
      Response response =
      await DioHelper.getData(url: EndPoint.posts);
      return Right(GetPostModel.fromJson(response.data));
    }
    on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
    catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}

