import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/model/category_selectmenu_model/category_selectmenu_model.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_states.dart';
import 'package:x_station_app/view_model/repo/login_repo/login_repo.dart';

import '../../../model/search_model/search_model.dart';
import '../../../utility/database/local/cach_data.dart';
import '../../../utility/database/local/cache_helper.dart';
import '../../repo/category_repo/category_repo.dart';
import '../../repo/search_repo/search_repo.dart';
import 'search_states.dart';

class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit(this.searchRepo):super(SearchInitialState());
  SearchRepo searchRepo;
  SearchModel ?searchModel;
  var searchController=TextEditingController();

  static SearchCubit get(context)=>BlocProvider.of<SearchCubit>(context);

  Future<void> getSearch()async{
    emit(SearchLoadingState());
    var data=await searchRepo.search(id: searchController.text);
    data.fold(
          (l) {
        emit(
            SearchErrorState(l.message));
      },
          (r) {
        emit(SearchSuccessState(r));
        searchModel=r;
      },
    );
  }



}