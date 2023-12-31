import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/view/screens/home_technical/home_technical_screen/home_technical_screen.dart';
import 'package:x_station_app/view/screens/login/login_screen/login_screen.dart';
import 'package:x_station_app/view/screens/notification_technican/notification_technician_screen/notification_technician_screen.dart';
import 'package:x_station_app/view/screens/order_list/order_list_screen/order_list_screen.dart';
import 'package:x_station_app/view/screens/profile/profile_screen/profile_screen.dart';

import '../../../core/text_manager/text_manager.dart';
import '../../../utility/database/local/cach_data.dart';
import '../../../view/screens/category/catogort_screen/ctegory_screen.dart';
import '../../../view/screens/electrician_information/electrician_information_screen/electrician_information_Screen.dart';
import '../../../view/screens/home/home_screen/home_screen.dart';
import '../../../view/screens/notification/notification_screen/notification_screen.dart';
import 'home_layout_states.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInitialState());

  static HomeLayoutCubit get(context) => BlocProvider.of<HomeLayoutCubit>(context);
  int currentIndex = 0;
  String selectedValue=TextManager.client;


  List<Widget> pageList(){
    return[
      CachingDataManager.instance.getLoginModel().data?.type=='customer'?const HomeScreen():const HomeTechnicalScreen(),
      CachingDataManager.instance.getLoginModel().data?.type=='customer'?const CategoryScreen():const OrderListScreen(),
      CachingDataManager.instance.getLoginModel().data?.type=='customer'? const NotificationScreen():const NotificationTechnicianScreen(),
       const ProfileScreen(),
    ];
  }

  void bottomTap(int index)
  {
    currentIndex=index;

    emit(HomeBottomNavBarChange());
  }

}