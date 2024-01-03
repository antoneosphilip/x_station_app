import 'package:x_station_app/model/category_selectmenu_model/category_selectmenu_model.dart';
import 'package:x_station_app/model/login_model/login_model.dart';

import '../../../model/add_favorite_model/add_favorite_model.dart';
import '../../../model/category_model/category_model.dart';

abstract class AddFavoriteStates{}
class AddFavoriteInitialState extends AddFavoriteStates{}
class AddFavoriteLoadingState extends AddFavoriteStates{}
class AddFavoriteSuccessState extends AddFavoriteStates{
 AddFavoriteModel addFavoriteMode;
AddFavoriteSuccessState(this.addFavoriteMode);
}
class AddFavoriteErrorState extends AddFavoriteStates{
 final String err;

  AddFavoriteErrorState(this.err);

}


class GetFavoriteLoadingState extends AddFavoriteStates{}
class  GetFavoriteSuccessState extends AddFavoriteStates{
 AddFavoriteModel addFavoriteMode;
 GetFavoriteSuccessState(this.addFavoriteMode);
}
class  GetFavoriteErrorState extends AddFavoriteStates{
 final String err;

 GetFavoriteErrorState(this.err);

}

