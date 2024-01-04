import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/model/accept_post_model/accept_post_model.dart';
import 'package:x_station_app/model/apply_post_model/apply_post_model.dart';
import 'package:x_station_app/model/get_post_model/get_post_model.dart';
import 'package:x_station_app/model/show_post_model/show_post_model.dart';
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
  GetPostModel? getPostModel;
  static PostsCubit get(context)=>BlocProvider.of<PostsCubit>(context);
  var titleController=TextEditingController();
  var descriptionController=TextEditingController();
  var reviewController=TextEditingController();

  var formKey = GlobalKey<FormState>();
  ApplyPostModel? applyPostModel;
  ShowPostModel? showPostModel;
  AcceptPostModel? acceptPostModel;


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
      formData.files.add(MapEntry("image", await di.MultipartFile.fromFile(fileImage!.path,filename:fileImage!.path.split('/').last)));
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
        getPosts();
      },
    );
  }




  /////////////////////////get post//////////////////////////////
Map<int,bool> isApply={};
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
            getPostModel=r;
            getPostModel?.data?.forEach((element) {
              isApply?.addAll({
                element.id!:element.isApplied==0?true:false,
              });
            });
            print("modelll");
            print(isApply);


          },
    );
  }


  /////////////////////////apply post//////////////////////////////

  Future<void> applyPost({required id})async{
    isApply![id]=!isApply![id]!;
    emit(ApplyPostsLoadingState());
    var data=await postsRepo.applyPost(id: id);
    data.fold(
          (l) {
        emit(
            ApplyPostsErrorState(l.message));
        isApply![id]=!isApply![id]!;

          },
          (r) {
        emit(ApplyPostsSuccessState(r));
        applyPostModel=r;
        getPosts();


          },
    );
  }

/////////////////show post///////////////
  Future<void> showPost({required id})async{
    emit(ShowPostsLoadingState());
    var data=await postsRepo.showPost(id: id);
    data.fold(
          (l) {
        emit(
            ShowPostsErrorState(l.message));
      },
          (r) {
        emit(ShowPostsSuccessState(r));
        showPostModel=r;

      },
    );
  }

  Map<String,bool>? x;
  void changeMode({String? message}){
    if(message=='Applied Successfully'){
      x={'Applied Successfully':true};
    }
    else{
      x={'Canceled Successfully':false};

    }
    print("sssssssssssssssss");
    print(x);
    emit(ChangeMode());
  }

  /////////////////accept post///////////////
  Future<void> acceptPost({required userId,required postId,required status})async{
    emit(AcceptPostLoadingState());
    var data=await postsRepo.acceptPost(userId: userId,postId: postId,status: status);
    data.fold(
          (l) {
        emit(
            AcceptPostErrorState(l.message));
      },
          (r) {
        emit(AcceptPostSuccessState(r));
        acceptPostModel=r;

      },
    );
  }



  /////////////////user Rate///////////////
  Future<void> userRate({required userId,required rate})async{
    emit(UserRateLoadingState());
    var data=await postsRepo.userRate(userId: userId,rate: rate);
    data.fold(
          (l) {
        emit(
            UserRateErrorState(l.message));
      },
          (r) {
        emit(UserRateSuccessState(r));
        acceptPostModel=r;

      },
    );
  }
}