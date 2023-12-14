import 'package:x_station_app/model/login_model/login_model.dart';

import '../../../model/profile_model/profile_model.dart';
import '../../../model/signup_model/signup_model.dart';

abstract class ProfileStates{}
class ProfileInitialState extends ProfileStates{}
class ProfileLoadingState extends ProfileStates{}
class ProfileSuccessState extends ProfileStates{
ProfileModel profileModel;
ProfileSuccessState(this.profileModel);
}
class ProfileErrorState extends ProfileStates{
 final String err;

  ProfileErrorState(this.err);

}