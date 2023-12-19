import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/model/login_model/login_model.dart';
import 'package:x_station_app/model/notification_model/notification_model.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_states.dart';
import 'package:x_station_app/view_model/repo/login_repo/login_repo.dart';

import '../../../utility/database/local/cach_data.dart';
import '../../../utility/database/local/cache_helper.dart';
import '../../repo/notification_repo/notification_repo.dart';
import 'notification_states.dart';

class GetNotificationCubit extends Cubit<GetNotificationStates>
{
  GetNotificationCubit(this.getNotificationRepo):super(GetNotificationInitialState());
  GetNotificationRepo getNotificationRepo;
  NotificationModel? notificationModel;
  static GetNotificationCubit get(context)=>BlocProvider.of<GetNotificationCubit>(context);


  Future<void> getNotification()async{
    emit(GetNotificationLoadingState());
    var data=await getNotificationRepo.getNotification();
    data.fold(
          (l) {
            print(l);
        emit(
            GetNotificationErrorState(l.message));
      },
          (r) {
        emit(GetNotificationSuccessState(r));
        notificationModel=r;
      },
    );
  }

}