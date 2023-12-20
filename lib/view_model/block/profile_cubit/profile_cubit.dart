import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/model/profile_model/profile_model.dart';
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
  ProfileModel? profileModel;
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  var addressController=TextEditingController();
  var oldPasswordController=TextEditingController();
  var newPasswordController=TextEditingController();
  var confirmPasswordController=TextEditingController();

  static ProfileCubit get(context)=>BlocProvider.of<ProfileCubit>(context);
  final List<String> list = ['🇺🇸 English', '🇪🇬 العربية',];
   String selectedItem =
      CacheHelper.getDataString(key: 'Language') ?? '🇺🇸 English';


//////////// get profile data/////////
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
            profileModel=r;

          },
    );
  }



  ////////////// update profile data////////////
  Future<void> updateProfileData()async{
    emit(UpdateProfileLoadingState());
    var data=await profileRepo.updateProfileData( nameController.text, addressController.text,  phoneController.text,  emailController.text);
    data.fold(
          (l) {
        print(l);
        emit(
            UpdateProfileErrorState(l.message));
      },
          (r) {
        emit(UpdateProfileSuccessState(r));
        getProfileData();

      },
    );
  }




  /////////////log out//////////////
  Future<void> logOut()async{
    emit(LogOutLoadingState());
    var data=await profileRepo.logOut();
    data.fold(
          (l) {
        print(l);
        emit(
            LogOutErrorState(l.message));
      },
          (r) {
        emit(LogOutSuccessState(r));

      },
    );
  }



  //////////////change password////////////
  Future<void> changePassword()async{
    emit(ChangePasswordLoadingState());
    var data=await profileRepo.changePassword(
        oldPasswordController.text,
        newPasswordController.text,
        confirmPasswordController.text,
    );
    data.fold(
          (l) {
        print(l);
        emit(
            ChangePasswordErrorState(l.message));
      },
          (r) {
        emit(ChangePasswordSuccessState(r));
        getProfileData();

      },
    );
  }

  void changeLanguage(String? value) {
    Get.updateLocale(Locale(value == '🇺🇸 English'
        ? 'en'
        : value == '🇪🇬 العربية'
        ? 'ar'
        : 'ar'));
    CacheHelper.put(key: 'Language', value: value);
    emit(ChangeLanguage());
  }
}