import 'package:x_station_app/model/category_selectmenu_model/category_selectmenu_model.dart';
import 'package:x_station_app/model/login_model/login_model.dart';

import '../../../model/category_model/category_model.dart';

abstract class CategoryStates{}
class CategoryInitialState extends CategoryStates{}
class CategoryLoadingState extends CategoryStates{}
class CategorySuccessState extends CategoryStates{
CategoryModel categoryModel;
CategorySuccessState(this.categoryModel);
}
class CategoryErrorState extends CategoryStates{
 final String err;

  CategoryErrorState(this.err);

}

class CategorySelectMenuLoadingState extends CategoryStates{}
class CategorySelectMenuSuccessState extends CategoryStates{
 CategorySelectMenuModel categorySelectMenuModel;
 CategorySelectMenuSuccessState(this.categorySelectMenuModel);
}
class CategorySelectMenuErrorState extends CategoryStates{
 final String err;

 CategorySelectMenuErrorState(this.err);

}