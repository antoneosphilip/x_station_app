import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/model/category_selectmenu_model/category_selectmenu_model.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_states.dart';
import 'package:x_station_app/view_model/repo/login_repo/login_repo.dart';

import '../../../model/order_list_model/order_list_model.dart';
import '../../../model/search_model/search_model.dart';
import '../../../utility/database/local/cach_data.dart';
import '../../../utility/database/local/cache_helper.dart';
import '../../repo/category_repo/category_repo.dart';
import '../../repo/order_list_repo/order_list_repo.dart';
import '../../repo/search_repo/search_repo.dart';
import 'order_list_states.dart';

class OrderListCubit extends Cubit<OrderListStates>
{
  OrderListCubit(this.orderListRepo):super(OrderListInitialState());
  OrderListRepo orderListRepo;
  OrderListModel ?orderListModel;

  static OrderListCubit get(context)=>BlocProvider.of<OrderListCubit>(context);

  Future<void> getOrderList()async{
    emit(OrderListLoadingState());
    var data=await orderListRepo.getOrderList();
    data.fold(
          (l) {
        emit(
            OrderListErrorState(l.message));
      },
          (r) {
        emit(OrderListSuccessState(r));
        orderListModel=r;
      },
    );
  }



}