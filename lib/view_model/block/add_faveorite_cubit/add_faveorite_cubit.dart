import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/model/category_selectmenu_model/category_selectmenu_model.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_states.dart';
import 'package:x_station_app/view_model/repo/login_repo/login_repo.dart';

import '../../../model/add_favorite_model/add_favorite_model.dart';
import '../../../utility/database/local/cach_data.dart';
import '../../../utility/database/local/cache_helper.dart';
import '../../repo/add_faveorite_repo/add_favorite_repo.dart';
import '../../repo/category_repo/category_repo.dart';
import 'add_faveorite_states.dart';

class AddFavoriteCubit extends Cubit<AddFavoriteStates>
{
  AddFavoriteCubit(this.addFavoriteRepo):super(AddFavoriteInitialState());
  AddFavoriteModel ?addFavoriteModel;
  AddFavoriteRepo addFavoriteRepo;

  static AddFavoriteCubit get(context)=>BlocProvider.of<AddFavoriteCubit>(context);

  Future<void> addFavorite({required id})async{
    emit(AddFavoriteLoadingState());
    var data=await addFavoriteRepo.addFavorite(id: id);
    data.fold(
          (l) {
        emit(
            AddFavoriteErrorState(l.message));
      },
          (r) {
        emit(AddFavoriteSuccessState(r));
        addFavoriteModel=r;
      },
    );
  }

/////////////////get favorite/////////////
  Future<void> getFavorite()async{
    emit( GetFavoriteLoadingState());
    var data=await addFavoriteRepo.getFavorite();
    data.fold(
          (l) {
        emit(
            GetFavoriteErrorState(l.message));
      },
          (r) {
        emit( GetFavoriteSuccessState(r));
        addFavoriteModel=r;
      },
    );
  }


}