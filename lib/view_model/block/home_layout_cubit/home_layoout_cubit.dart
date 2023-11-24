import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view/screens/home/home_screen/home_screen.dart';
import 'home_layout_states.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInitialState());

  static HomeLayoutCubit get(context) => BlocProvider.of<HomeLayoutCubit>(context);
  int currentIndex = 0;

  List<Widget> pageList = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  void bottomTap(int index)
  {
    currentIndex=index;

    emit(HomeBottomNavBarChange());
  }
}