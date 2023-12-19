import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_station_app/view/screens/home/home_widget/posting_shimmer/posting_shimmer.dart';

import '../../../../../view_model/block/notification_cubit/notification_cubit.dart';
import '../../../../../view_model/block/notification_cubit/notification_states.dart';
import 'notification_item.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetNotificationCubit,GetNotificationStates>(
      listener: (context,state){},
      builder: (context,state){
        return state is GetNotificationLoadingState?
            const PostingShimmer(isText: false,):
       ( GetNotificationCubit.get(context).notificationModel!=null)?
       ListView.separated(
           scrollDirection: Axis.vertical,
           dragStartBehavior: DragStartBehavior.start,
           shrinkWrap: true,
           physics: const NeverScrollableScrollPhysics(),
           itemBuilder: (context, index) {
             return  NotificationItem(
               message: GetNotificationCubit.get(context).notificationModel!.data![index].data!.message!,
               date:  GetNotificationCubit.get(context).notificationModel!.data![index].createdAt!,
               id: GetNotificationCubit.get(context).notificationModel!.data![index].notifiableId!,
             );
           },
           separatorBuilder: (context, index) {
             return const SizedBox(height: 0);
           },
           itemCount: GetNotificationCubit.get(context).notificationModel!.data!.length,
       ):
           state is GetNotificationErrorState?
            Text(state.err):const PostingShimmer(isText: false,);

      },
    );
  }
}
