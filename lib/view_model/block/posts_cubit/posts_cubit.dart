import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import '../../../model/posts_model/posts_model.dart';
import '../../repo/category_repo/category_repo.dart';
import '../../repo/posts_repo/posts_repo.dart';
import 'posts_states.dart';

class PostsCubit extends Cubit<PostsStates>
{
  PostsCubit(this.postsRepo):super(PostsInitialState());
  PostsRepo postsRepo;
  PostsModel ?postsModel;
  static PostsCubit get(context)=>BlocProvider.of<PostsCubit>(context);

  Future<void> getPosts()async{
    emit(GetPostsLoadingState());
    var data=await postsRepo.getPost();
    data.fold(
          (l) {
        emit(
            GetPostsErrorState(l.message));
      },
          (r) {
        emit(GetPostsSuccessState(r));
        postsModel=r;
      },
    );
  }

}