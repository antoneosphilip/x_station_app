import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_station_app/view/screens/home/home_widget/posting_shimmer/posting_shimmer.dart';

import '../../../../../view_model/block/notification_cubit/notification_cubit.dart';
import '../../../../../view_model/block/notification_cubit/notification_states.dart';
import '../../../../../view_model/block/notification_technician_cubit/notification_technician_cubit.dart';
import '../../../../../view_model/block/notification_technician_cubit/notification_technician_states.dart';
import 'notification_techinican_item.dart';

class NotificationTechnicianList extends StatelessWidget {
  const NotificationTechnicianList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetNotificationTechnicianCubit,GetNotificationTechnicianStates>(
      listener: (context,state){},
      builder: (context,state){
        return state is GetNotificationTechnicianLoadingState?
            const PostingShimmer(isText: false,):
       ( GetNotificationTechnicianCubit.get(context).notificationTechnicianModel!=null)?
       ListView.separated(
           scrollDirection: Axis.vertical,
           dragStartBehavior: DragStartBehavior.start,
           shrinkWrap: true,
           physics: const NeverScrollableScrollPhysics(),
           itemBuilder: (context, index) {
             return  NotificationTechnicianItem(
               message: GetNotificationTechnicianCubit.get(context).notificationTechnicianModel!.data![index].data!.message!,
               date:  GetNotificationTechnicianCubit.get(context).notificationTechnicianModel!.data![index].createdAt!,
               id: GetNotificationTechnicianCubit.get(context).notificationTechnicianModel!.data![index].notifiableId!,
               imagePerson: ''
             );
           },
           separatorBuilder: (context, index) {
             return const SizedBox(height: 0);
           },
           itemCount: GetNotificationTechnicianCubit.get(context).notificationTechnicianModel!.data!.length,
       ):
           state is GetNotificationTechnicianErrorState?
            Text(state.err):const PostingShimmer(isText: false,);

      },
    );
  }
}
