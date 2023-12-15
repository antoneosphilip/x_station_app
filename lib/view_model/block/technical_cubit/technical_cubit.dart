import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/model/technical_model/technical_model.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_states.dart';
import 'package:x_station_app/view_model/repo/login_repo/login_repo.dart';
import 'package:x_station_app/view_model/repo/technical_repo/technical_repo.dart';

import '../../../utility/database/local/cach_data.dart';
import '../../../utility/database/local/cache_helper.dart';
import '../../repo/category_repo/category_repo.dart';
import 'technical_states.dart';

class TechnicalCubit extends Cubit<TechnicalStates>
{
  TechnicalCubit(this.technicalRepo):super(TechnicalInitialState());
  TechnicalRepo technicalRepo;
  TechnicalListModel ?technicalModel;
  static TechnicalCubit get(context)=>BlocProvider.of<TechnicalCubit>(context);

  Future<void> getTechnicalList({required id})async{
    emit(TechnicalLoadingState());
    var data=await technicalRepo.getTechnicalList(id: id);
    data.fold(
          (l) {
        emit(
            TechnicalErrorState(l.message));
      },
          (r) {
        emit(TechnicalSuccessState(r));
        technicalModel=r;
      },
    );
  }

}