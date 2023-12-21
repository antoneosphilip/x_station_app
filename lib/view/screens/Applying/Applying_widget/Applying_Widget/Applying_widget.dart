import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/flutter_toast/flutter_toast.dart';
import 'package:x_station_app/view/core_widget/tab_bar_widget/tab_bar_widget.dart';
import 'package:x_station_app/view/notification_module/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:x_station_app/view/screens/Applying/Applying_widget/Applying_form/Applying_form.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_cubit.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_states.dart';

import '../../../../../view_model/block/notification_cubit/notification_cubit.dart';

class ApplayWidget extends StatelessWidget {
  final String title;
  final String description;
  final int id;
  final int isApplied;

  const ApplayWidget({super.key, required this.title, required this.description, required this.id, required this.isApplied});


  @override
  Widget build(BuildContext context) {
    Color? color;
    return Column(
      children: [
        AppBarWidget(text: TextManager.apply.tr,),
         ApplyForm(description: description,title: title),
        SizedBox(
          height: 58.h,
        ),
        BlocConsumer<PostsCubit,PostsStates>(
          listener: (context,state) async {
            if(state is ApplyPostsLoadingState)
            {
              await EasyLoading.show(
                status: 'loading...',
                maskType: EasyLoadingMaskType.black,
              );
            }
            if(state is ApplyPostsSuccessState)
            {
            EasyLoading.dismiss();
            showFlutterToast(message: state.applyPostModel.message, state: ToastState.SUCCESS);
            PostsCubit.get(context).changeMode();
            //
            // PostsCubit.get(context).changeColor(message: state.applyPostModel.message);
            // PostsCubit.get(context).changeText(message: state.applyPostModel.message);
            // PostsCubit.get(context).showPost(id: id);

            }
            if(state is ApplyPostsErrorState)
            {
              EasyLoading.dismiss();
              showFlutterToast(message: state.err, state: ToastState.ERROR);
            }
          },
          builder: (context,state){
            return Padding(
              padding: const EdgeInsets.only(left: 197),
              child: InkWell(
                onTap: (){
                  PostsCubit.get(context).applyPost(id: id);
                  PostsCubit.get(context).showPost(id: id);
                  GetNotificationCubit.get(context).getNotification();
                  GetNotificationCubit.get(context).bindNotification();

                },
                child: Container(
                  height: 50.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color:PostsCubit.get(context).isApply![id]!?ColorManager.colorPrimary:Colors.red),
                  child: Center(
                    child: Text(
                      PostsCubit.get(context).isApply![id]!?TextManager.Applynow.tr:TextManager.cancel.tr,
                      style: TextStyleManager.textStyle20600.copyWith(fontWeight: FontWeight.w600,color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
