import 'package:x_station_app/model/login_model/login_model.dart';

import '../../../model/add_favorite_model/add_favorite_model.dart';
import '../../../model/category_model/category_model.dart';
import '../../../model/get_fav_model/get_fav_model.dart';
import '../../../model/technical_model/technical_model.dart';

abstract class TechnicalStates{}
class TechnicalInitialState extends TechnicalStates{}
class TechnicalLoadingState extends TechnicalStates{}
class TechnicalSuccessState extends TechnicalStates{
TechnicalListModel technicalModel;
TechnicalSuccessState(this.technicalModel);
}
class TechnicalErrorState extends TechnicalStates{
 final String err;

  TechnicalErrorState(this.err);

}


class GetFavoriteLoadingState extends TechnicalStates{}
class  GetFavoriteSuccessState extends TechnicalStates{
 GetFavoriteModel getFavoriteModel;
 GetFavoriteSuccessState(this.getFavoriteModel);
}
class  GetFavoriteErrorState extends TechnicalStates{
 final String err;

 GetFavoriteErrorState(this.err);

}

class AddFavoriteLoadingState extends TechnicalStates{}
class AddFavoriteSuccessState extends TechnicalStates{
 AddFavoriteModel addFavoriteMode;
 AddFavoriteSuccessState(this.addFavoriteMode);
}
class AddFavoriteErrorState extends TechnicalStates{
 final String err;

 AddFavoriteErrorState(this.err);

}
