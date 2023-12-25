import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:x_station_app/view_model/block/order_list_cubit/order_list_cubit.dart';
import 'package:x_station_app/view_model/block/order_list_cubit/order_list_states.dart';

import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/style_font_manager/style_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../../view_model/block/posts_cubit/posts_cubit.dart';
import '../../../../view_model/block/posts_cubit/posts_states.dart';
import '../../../../view_model/block/profile_cubit/profile_cubit.dart';
import '../../home/home_widget/home_top_services/home_top_service_item.dart';
import '../../home/home_widget/posting_shimmer/posting_shimmer.dart';
import '../../home_technical/home_technical_widget/home_top_services/home_top_service_item.dart';
import 'order_list_item.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderListCubit,OrderListStates>(
        listener: (context,state){},
        builder: (context,state){
          return state is OrderListLoadingState?const PostingShimmer(isText:false,):
          (OrderListCubit.get(context).orderListModel!=null)?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                child: Text(TextManager.orderList.tr,style: TextStyleManager.textStyle36w700.copyWith(fontSize: 25.sp,fontWeight: FontWeight.w500,color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorBlack,),),
              ),
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return OrderListItem(
                    description:OrderListCubit.get(context).orderListModel!.data![index].description! ,
                    title:OrderListCubit.get(context).orderListModel!.data![index].title!,
                    image: OrderListCubit.get(context).orderListModel!.data![index].image! ,
                    id:OrderListCubit.get(context).orderListModel!.data![index].id!,
                    namePerson: '',
                    isApplied: 1, isJob: 1 ,
                    // imagePerson:OrderListCubit.get(context).orderListModel!.data![index].user!.avatar! ,
                  );
                },
                separatorBuilder: (context,index){
                  return SizedBox(height: 16.h);
                },
                itemCount: OrderListCubit.get(context).orderListModel!.data!.length,
              ),
            ],
          ):
          state is OrderListErrorState?
          Text(state.err):const PostingShimmer(isText: false,);

        }
    );
  }
}
