import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_states.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_states.dart';
import 'package:x_station_app/view_model/repo/login_repo/login_repo.dart';
import 'package:x_station_app/view_model/repo/posts_repo/post_Repo.dart';
import 'dart:io' as io;
import 'package:dio/dio.dart' as di;

import '../../../utility/database/local/cach_data.dart';
import '../../../utility/database/local/cache_helper.dart';

class PostsCubit extends Cubit<PostsStates>
{
  PostsCubit(this.postsRepo):super(PostsInitialState());
  PostsRepo postsRepo;
  static PostsCubit get(context)=>BlocProvider.of<PostsCubit>(context);
  var titleController=TextEditingController();
  var descriptionController=TextEditingController();
  var formKey = GlobalKey<FormState>();

  ////////////////////////////SelectPhoto////////////////////////////
  io.File? fileImage;
  final ImagePicker picker = ImagePicker();
  Future selectPhoto()
  async
  {
    XFile?  image = await picker.pickImage(source: ImageSource.gallery);
    if(image!=null)
    {
      fileImage = io.File(image.path);
      emit(UploadImage());
    }
  }

/////////////////////////cancelImage//////////////////////////////

  void cancelImg()
  {
    fileImage = null ;
    emit(UploadImage());
  }


  /////////////////////////create post//////////////////////////////

  Future<void> createPosts()async{
    emit(PostsLoadingState());
    di.FormData formData = di.FormData.fromMap({
      "title":titleController.text,
      "description":descriptionController.text,
    });

    if(fileImage!=null)
    {
      formData.files.add(MapEntry("image", await di.MultipartFile.fromFile(fileImage!.path,filename:'upload.txt' )));
    }
    var data=await postsRepo.createPost( data: formData);
    data.fold(
          (l) {
        print(l);
        emit(
            PostsErrorState(l.message));
      },
          (r) {
        emit(PostsSuccessState(r));
      },
    );
  }




  /////////////////////////get post//////////////////////////////

  Future<void> getPosts()async{
    emit(GetPostsLoadingState());


    var data=await postsRepo.getPost();
    data.fold(
          (l) {
        print(l);
        emit(
            GetPostsErrorState(l.message));
      },
          (r) {
        emit(GetPostsSuccessState(r));
      },
    );
  }
}