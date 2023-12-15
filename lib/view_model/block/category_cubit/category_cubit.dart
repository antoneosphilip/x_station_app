import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/model/category_selectmenu_model/category_selectmenu_model.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_states.dart';
import 'package:x_station_app/view_model/repo/login_repo/login_repo.dart';

import '../../../utility/database/local/cach_data.dart';
import '../../../utility/database/local/cache_helper.dart';
import '../../repo/category_repo/category_repo.dart';
import 'category_states.dart';

class CategoryCubit extends Cubit<CategoryStates>
{
  CategoryCubit(this.categoryRepo):super(CategoryInitialState());
  CategoryRepo categoryRepo;
  CategoryModel ?categoryModel;
  CategorySelectMenuModel ?categorySelectMenuModel;

  static CategoryCubit get(context)=>BlocProvider.of<CategoryCubit>(context);

  Future<void> getCategory()async{
    emit(CategoryLoadingState());
    var data=await categoryRepo.getCategoryData();
    data.fold(
          (l) {
        emit(
            CategoryErrorState(l.message));
      },
          (r) {
        emit(CategorySuccessState(r));
        categoryModel=r;
      },
    );
  }


  Future<void> getCategorySelectMenu()async{
    emit(CategorySelectMenuLoadingState());
    var data=await categoryRepo.getCategorySelectMenuData();
    data.fold(
          (l) {
        emit(
            CategorySelectMenuErrorState(l.message));
      },
          (r) {
        emit(CategorySelectMenuSuccessState(r));
        print(data);
        categorySelectMenuModel=r;
      },
    );
  }

}