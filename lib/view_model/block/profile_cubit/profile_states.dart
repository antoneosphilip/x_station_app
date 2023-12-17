import 'package:x_station_app/model/chnage_password_model/chnage_password_model.dart';
import 'package:x_station_app/model/log_out_model/log_out_model.dart';
import 'package:x_station_app/model/login_model/login_model.dart';
import 'package:x_station_app/model/update_profile_model/update_prfile_model.dart';

import '../../../model/profile_model/profile_model.dart';
import '../../../model/signup_model/signup_model.dart';

abstract class ProfileStates{}
class ProfileInitialState extends ProfileStates{}
/////////// get profile data////////
class ProfileLoadingState extends ProfileStates{}
class ProfileSuccessState extends ProfileStates{
ProfileModel profileModel;
ProfileSuccessState(this.profileModel);
}
class ProfileErrorState extends ProfileStates{
 final String err;

  ProfileErrorState(this.err);

}


/////////////update profile data/////////
class UpdateProfileLoadingState extends ProfileStates{}
class UpdateProfileSuccessState extends ProfileStates{
 UpdateProfileModel updateProfileModel;
 UpdateProfileSuccessState(this.updateProfileModel);
}
class UpdateProfileErrorState extends ProfileStates{
 final String err;

 UpdateProfileErrorState(this.err);

}



/////////////log out//////////////
class LogOutLoadingState extends ProfileStates{}
class LogOutSuccessState extends ProfileStates{
 LogOutModel logOutModel;
 LogOutSuccessState(this.logOutModel);
}
class LogOutErrorState extends ProfileStates{
 final String err;

 LogOutErrorState(this.err);

}




/////////////change password/////////
class ChangePasswordLoadingState extends ProfileStates{}
class ChangePasswordSuccessState extends ProfileStates{
 ChangePasswordModel changePasswordModel;
 ChangePasswordSuccessState(this.changePasswordModel);
}
class ChangePasswordErrorState extends ProfileStates{
 final String err;

 ChangePasswordErrorState(this.err);

}class ChangeLanguage extends ProfileStates{}
