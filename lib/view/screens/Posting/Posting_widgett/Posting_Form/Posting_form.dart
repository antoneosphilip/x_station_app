import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/elevated_button/elevated_button_custom.dart';
import 'package:x_station_app/view/core_widget/flutter_toast/flutter_toast.dart';
import 'package:x_station_app/view/core_widget/text_form_field/text_form_field_custom.dart';
import 'package:x_station_app/view/core_widget/xstation_button_custom/x_station_button_custom.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_cubit.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_states.dart';

import '../../../../../core/color_manager/color_manager.dart';
import '../Posting_widget/show_image_Widget.dart';

class PostingForm extends StatefulWidget {
  const PostingForm({super.key});

  @override
  State<PostingForm> createState() => _PostingFormState();

}

class _PostingFormState extends State<PostingForm> {

  Timer? _timer;
  late double _progress;
  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    // EasyLoading.removeCallbacks();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 12.w,right: 23.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextManager.typeTitle,
                style: TextStyleManager.textStyle20600.copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 15.h,),
              TextFormFieldCustom(validate: (value){},
                hint: TextManager.writeTitle,
                controller: PostsCubit.get(context).titleController,

              ),
              SizedBox(height: 30.h,),

              Text(
                TextManager.type,
                style: TextStyleManager.textStyle20600.copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 22.h,),
              TextFormFieldCustom(validate: (value){},
                maxLines: 10,
                hint: TextManager.writeSomeThing,
                controller: PostsCubit.get(context).descriptionController,

              ),
            ],
          ),
        ),
        SizedBox(height: 16.h,),

        ElevatedButtonCustom(
          borderColor: ColorManager.colorXXWhite,
          onPressed: () async {
            PostsCubit.get(context).selectPhoto();


          }!,
          // onPressed: (){
          //        final A = MaterialPageRoute(builder: (context) =>(verification_screen()));
          //       Navigator.push(context, A);

          // },
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(TextManager.Addattachment!,style: TextStyleManager.textStyle20600.copyWith(fontWeight: FontWeight.w700),),
              SizedBox(width: 11.w,),
            ],
          ),
          colors: ColorManager.colorXXWhite,
        ),
        SizedBox(
          height: 50.h,
        ),
        BlocConsumer<PostsCubit,PostsStates>(
          listener: (context,state){},
          builder: (context,state)
          {
            return(PostsCubit.get(context).fileImage!=null)?
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                InkWell(
                    onTap: ()
                    {
                      Get.to(()=>ShowImage(fileImage: PostsCubit.get(context).fileImage!));
                    },
                    child: Image.file(PostsCubit.get(context).fileImage!)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: ()
                    {
                      PostsCubit.get(context).cancelImg();
                    },
                    child: const CircleAvatar(
                      backgroundColor: ColorManager.colorPrimary,
                      radius: 20,
                      child: Icon(Icons.cancel,size: 30,color: Colors.white,),
                    ),
                  ),
                )
              ],
            ): const SizedBox();
          },),
        SizedBox(
          height: 50.h,
        ),
        BlocConsumer<PostsCubit,PostsStates>(
          listener: (context,state) async {
            if(state is PostsSuccessState){
              _timer?.cancel();
              await EasyLoading.showSuccess('${state.createPostModel.message}',);
              PostsCubit.get(context).titleController.clear();
              PostsCubit.get(context).descriptionController.clear();

            }
            else if(state is PostsLoadingState){
              await EasyLoading.show(
                status: 'loading...',
                maskType: EasyLoadingMaskType.black,
              );
            }
            else if(state is PostsErrorState){
              _timer?.cancel();
              await EasyLoading.showError('${state.err}');

            }
          },

          builder: (context,state){
            return XStationButtonCustom(
              onPressed: (){
                PostsCubit.get(context).createPosts();
              },
              textButton: TextManager.Applynow,
            );
          },
        )
      ],
    );
  }
}
