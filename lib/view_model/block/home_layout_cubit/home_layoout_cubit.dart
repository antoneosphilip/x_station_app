import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/view/screens/home_technical/home_technical_screen/home_technical_screen.dart';
import 'package:x_station_app/view/screens/login/login_screen/login_screen.dart';
import 'package:x_station_app/view/screens/profile/profile_screen/profile_screen.dart';

import '../../../core/text_manager/text_manager.dart';
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
  selectedValue==TextManager.client?const HomeScreen():const HomeTechnicalScreen(),
   selectedValue==TextManager.client?const CategoryScreen():const NotificationScreen(),
      selectedValue==TextManager.client? const NotificationScreen():const ProfileScreen(),
  const ProfileScreen(),
    ];
  }

  void bottomTap(int index)
  {
    currentIndex=index;

    emit(HomeBottomNavBarChange());
  }

}