import 'package:x_station_app/model/login_model/login_model.dart';

import '../../../model/category_model/category_model.dart';
import '../../../model/posts_model/posts_model.dart';

abstract class PostsStates{}
class PostsInitialState extends PostsStates{}
class GetPostsLoadingState extends PostsStates{}
class GetPostsSuccessState extends PostsStates{
PostsModel categoryModel;
GetPostsSuccessState(this.categoryModel);
}
class GetPostsErrorState extends PostsStates{
 final String err;

 GetPostsErrorState(this.err);

}
