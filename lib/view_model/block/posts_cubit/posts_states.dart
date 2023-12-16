import 'package:x_station_app/model/create_post_model/create_post_model.dart';
import 'package:x_station_app/model/get_post_model/get_post_model.dart';
import 'package:x_station_app/model/login_model/login_model.dart';


abstract class PostsStates{}
class PostsInitialState extends PostsStates{}
class PostsLoadingState extends PostsStates{}
class PostsSuccessState extends PostsStates{
 CreatePostModel createPostModel;
 PostsSuccessState(this.createPostModel);
}
class PostsErrorState extends PostsStates{
 final String err;

 PostsErrorState(this.err);

}
class UploadImage extends PostsStates{}



class GetPostsLoadingState extends PostsStates{}
class GetPostsSuccessState extends PostsStates{
 GetPostModel getPostModel;
 GetPostsSuccessState(this.getPostModel);
}
class GetPostsErrorState extends PostsStates{
 final String err;

 GetPostsErrorState(this.err);

}