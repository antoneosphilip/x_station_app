// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_utils/get_utils.dart';
// import 'package:shimmer/shimmer.dart';
//
// import '../../../../../core/color_manager/color_manager.dart';
// import '../../../../../core/text_manager/text_manager.dart';
// import '../../../../core_widget/tab_bar_widget/tab_bar_widget.dart';
// import '../../manager/notification_cubit/notification_technician_cubit.dart';
// import '../notifications_widget/notifications_card.dart';
//
// class NotificationsScreen extends StatefulWidget {
//   const NotificationsScreen({super.key});
//
//   @override
//   State<NotificationsScreen> createState() => _NotificationsScreenState();
// }
//
// class _NotificationsScreenState extends State<NotificationsScreen> {
//   ScrollController _scrollController = ScrollController();
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   _scrollController.addListener(() {
//   //     if (_scrollController.position.pixels ==
//   //         _scrollController.position.maxScrollExtent) {
//   //       if (NotificationCubit.get(context).page <=
//   //           NotificationCubit.get(context).notificationModel!.meta!.lastPage!) {
//   //         NotificationCubit.get(context).getNotification();
//   //       }
//   //     }
//   //   });
//   //
//   //   super.initState();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<NotificationCubit, NotificationState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: ColorManager.colorScaffold,
//           body: SafeArea(
//             child: Column(
//               children: [
//                 AppBarWidget(
//                   text: TextManager.notification.tr,
//                   height: 124,
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 InkWell(
//                     onTap: (){
//                       print(NotificationCubit.get(context).notificationModel);
//                     },
//                     child: Text("s")),
//                 (state is NotificationLoadingState)
//                     ? const ShimmerNotificationLoading()
//                     : (NotificationCubit.get(context).notificationModel != null)
//                         ? Expanded(
//                             // width: ScreenUtil().screenWidth,
//                             // height: 700.h,
//                             child: ListView.separated(
//                                 controller: _scrollController,
//                                 itemBuilder: (context, index) =>
//                                     NotificationsCard(
//                                       notificationModelData:
//                                           NotificationCubit.get(context)
//                                               .notificationModel!
//                                               .data![index],
//                                     ),
//                                 separatorBuilder: (context, index) => SizedBox(
//                                       height: 10.h,
//                                     ),
//                                 itemCount: NotificationCubit.get(context)
//                                     .notificationModel!
//                                     .data!
//                                     .length))
//                         : (state is NotificationErrorState)
//                             ? Center(
//                                 child: Text(state.error),
//                               )
//                             : Container()
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class ShimmerNotificationLoading extends StatelessWidget {
//   const ShimmerNotificationLoading({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         // width: ScreenUtil().screenWidth,
//         // height: 700.h,
//         child: ListView.separated(
//             itemBuilder: (context, index) => Shimmer.fromColors(
//                   baseColor: ColorManager.colorWhite,
//                   highlightColor: ColorManager.colorPrimary,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         const CircleAvatar(
//                           radius: 50.0,
//                           backgroundColor: Colors.white,
//                         ),
//                         SizedBox(
//                           width: 10.w,
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               width: 260.w,
//                               height: 100.h,
//                               color: Colors.white,
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//             separatorBuilder: (context, index) => SizedBox(
//                   height: 10.h,
//                 ),
//             itemCount: 10));
//   }
// }
