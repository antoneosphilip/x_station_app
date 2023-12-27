import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/model/login_model/login_model.dart';
import 'package:x_station_app/model/notification_model/notification_model.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_states.dart';
import 'package:x_station_app/view_model/repo/login_repo/login_repo.dart';

import '../../../model/notification_Technician_model/notification_Technician_model.dart';
import '../../../model/notification_Technician_model/notification_Technician_model.dart';
import '../../../model/notification_Technician_model/notification_Technician_model.dart';
import '../../../model/notification_Technician_model/notification_Technician_model.dart' as noteModel;
import '../../../utility/database/local/cach_data.dart';
import '../../../utility/database/local/cache_helper.dart';
import '../../../utility/database/network/pusher_helper.dart';
import 'dart:math' as math;

import '../../../view/notification_module/presentation/manager/notification_cubit/notification_cubit.dart';
import '../../repo/notification_Technician_repo/notification_Technician_repo.dart';
import '../../repo/notification_repo/notification_repo.dart';
import 'notification_technician_states.dart';

class GetNotificationTechnicianCubit extends Cubit<GetNotificationTechnicianStates>
{
  GetNotificationTechnicianCubit(this.getNotificationRepo):super(GetNotificationTechnicianInitialState());
  GetNotificationTechnicianRepo getNotificationRepo;
  noteModel.NotificationTechnicianModel? notificationTechnicianModel;
  static GetNotificationTechnicianCubit get(context)=>BlocProvider.of<GetNotificationTechnicianCubit>(context);


  Future<void> getNotification()async{
    emit(GetNotificationTechnicianLoadingState());
    var data=await getNotificationRepo.getNotification();
    data.fold(
          (l) {
            print(l);
        emit(
            GetNotificationTechnicianErrorState(l.message));
      },
          (r) {
            emit( GetNotificationTechnicianSuccessState(r));
            notificationTechnicianModel=r;
      },
    );
  }


  Future<void> bindNotification() async {
    PusherHelper.pusherHelper.bind3(
        "Illuminate\\Notifications\\Events\\BroadcastNotificationCreated",
            (event) {
          print("Illuminate\Notifications\Events\BroadcastNotificationCreated");
          print(event!.data);
          NotificationModelData data =
          NotificationModelData.fromJson(jsonDecode(event!.data!));

          if (data!.notificationType == "message_sent") {
            AwesomeNotifications().createNotification(
                content: NotificationContent(
                  id: math.Random().nextInt(100),
                  channelKey: 'basic_channel',
                  actionType: ActionType.Default,
                  title: 'Message',
                  body: 'Support Message',
                ));
            if (notificationTechnicianModel == null) {
              getNotification();
            } else {
              notificationTechnicianModel!.data!.insert(0, noteModel.Data());
            }
          }
        });
  }

}