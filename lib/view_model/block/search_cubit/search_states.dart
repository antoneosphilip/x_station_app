import 'package:x_station_app/model/category_selectmenu_model/category_selectmenu_model.dart';
import 'package:x_station_app/model/login_model/login_model.dart';

import '../../../model/category_model/category_model.dart';
import '../../../model/search_model/search_model.dart';

abstract class SearchStates{}
class SearchInitialState extends SearchStates{}
class SearchLoadingState extends SearchStates{}
class SearchSuccessState extends SearchStates{
SearchModel searchModel;
SearchSuccessState(this.searchModel);
}
class SearchErrorState extends SearchStates{
 final String err;

  SearchErrorState(this.err);

}
