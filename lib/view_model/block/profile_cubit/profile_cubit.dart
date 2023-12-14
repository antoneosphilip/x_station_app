import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_states.dart';
import 'package:x_station_app/view_model/block/profile_cubit/profile_states.dart';
import 'package:x_station_app/view_model/block/signup_cubit/signup_states.dart';
import 'package:x_station_app/view_model/repo/login_repo/login_repo.dart';
import 'package:x_station_app/view_model/repo/profile_repo/profile_repo.dart';
import 'package:x_station_app/view_model/repo/signup_repo/sigup_repo.dart';

import '../../../utility/database/local/cach_data.dart';
import '../../../utility/database/local/cache_helper.dart';

class ProfileCubit extends Cubit<ProfileStates>
{
  ProfileCubit(this.profileRepo):super(ProfileInitialState());
  ProfileRepo profileRepo;
  static ProfileCubit get(context)=>BlocProvider.of<ProfileCubit>(context);


  Future<void> getProfileData()async{
    emit(ProfileLoadingState());
    var data=await profileRepo.getProfileData();
    data.fold(
          (l) {
            print(l);
        emit(
            ProfileErrorState(l.message));
      },
          (r) {
            emit(ProfileSuccessState(r));
      },
    );
  }

}