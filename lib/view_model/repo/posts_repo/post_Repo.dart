import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:x_station_app/core/errors/faliuar.dart';
import 'package:x_station_app/model/get_post_model/get_post_model.dart';
import 'package:x_station_app/utility/database/network/dio-helper.dart';

import '../../../model/accept_post_model/accept_post_model.dart';
import '../../../model/apply_post_model/apply_post_model.dart';
import '../../../model/create_post_model/create_post_model.dart';
import '../../../model/login_model/login_model.dart';
import '../../../model/show_post_model/show_post_model.dart';
import '../../../utility/database/network/end_points.dart';

abstract class PostsRepo{
  Future<Either<Failure,CreatePostModel>> createPost({required dynamic data});
  Future<Either<Failure,GetPostModel>> getPost();
  Future<Either<Failure,ApplyPostModel>> applyPost({required id});
  Future<Either<Failure,ShowPostModel>> showPost({required id});
  Future<Either<Failure,AcceptPostModel>> acceptPost({required userId,required postId,required status});


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



  @override
  Future<Either<Failure,ApplyPostModel>> applyPost({required id}) async {
    try {
      Response response =
      await DioHelper.getData(url: '/technicals/post/${id}/apply');
      return Right(ApplyPostModel.fromJson(response.data));
    }
    on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
    catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }


  @override
  Future<Either<Failure,ShowPostModel>> showPost({required id}) async {
    try {
      Response response =
      await DioHelper.getData(url: '/posts/${id}');
      return Right(ShowPostModel.fromJson(response.data));
    }
    on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
    catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }


  @override
  Future<Either<Failure,AcceptPostModel>> acceptPost({required userId,required postId,required status})
  async {
    try {
      Response response =
      await DioHelper.postData(
        url: EndPoint.acceptPostEndPoint,
        data: {
          'post_id':postId,
          'user_id':userId,
          'status':status,
        },
      );
      return Right(AcceptPostModel.fromJson(response.data));
    }
    on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
    catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

}

