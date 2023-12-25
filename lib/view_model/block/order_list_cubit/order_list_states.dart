import 'package:x_station_app/model/category_selectmenu_model/category_selectmenu_model.dart';
import 'package:x_station_app/model/login_model/login_model.dart';

import '../../../model/category_model/category_model.dart';
import '../../../model/order_list_model/order_list_model.dart';
import '../../../model/search_model/search_model.dart';

abstract class OrderListStates{}
class OrderListInitialState extends OrderListStates{}
class OrderListLoadingState extends OrderListStates{}
class OrderListSuccessState extends OrderListStates{
OrderListModel orderListModel;
OrderListSuccessState(this.orderListModel);
}
class OrderListErrorState extends OrderListStates{
 final String err;

  OrderListErrorState(this.err);

}
