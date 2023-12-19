import 'package:x_station_app/model/apply_post_model/apply_post_model.dart';
import 'package:x_station_app/model/create_post_model/create_post_model.dart';
import 'package:x_station_app/model/get_post_model/get_post_model.dart';
import 'package:x_station_app/model/login_model/login_model.dart';

import '../../../model/show_post_model/show_post_model.dart';


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


class ApplyPostsLoadingState extends PostsStates{}
class ApplyPostsSuccessState extends PostsStates{
 ApplyPostModel applyPostModel;
 ApplyPostsSuccessState(this.applyPostModel);
}
class ApplyPostsErrorState extends PostsStates{
 final String err;

 ApplyPostsErrorState(this.err);

}
class ChangeColor extends PostsStates{}
class ChangeText extends PostsStates{}

////////show post//////
class ShowPostsLoadingState extends PostsStates{}
class ShowPostsSuccessState extends PostsStates{
 ShowPostModel showPostModel;
 ShowPostsSuccessState(this.showPostModel);
}
class ShowPostsErrorState extends PostsStates{
 final String err;

 ShowPostsErrorState(this.err);

}
class ChangeMode extends PostsStates{}
