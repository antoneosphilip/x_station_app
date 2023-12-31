import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/model/technical_model/technical_model.dart';
import 'package:x_station_app/view/core_widget/custom_circle_loading/custom_circle_loading.dart';
import 'package:x_station_app/view/screens/home/home_widget/posting_shimmer/posting_shimmer.dart';
import 'package:x_station_app/view_model/block/technical_cubit/technical_cubit.dart';
import 'package:x_station_app/view_model/block/technical_cubit/technical_states.dart';

import '../electrian_details_shimmer/electrican_details_shimmer.dart';
import '../electrician_details_item/electrician_details_item.dart';


class ElectricianDetailsList extends StatelessWidget {
  final int id;
  const ElectricianDetailsList({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    TechnicalCubit.get(context).getTechnicalList(id: id);
    return BlocConsumer<TechnicalCubit,TechnicalStates>(
      listener: (context,state){},
      builder: (context,state){
        return state is TechnicalLoadingState?const PostingShimmer(isText: false,):
            (TechnicalCubit.get(context).technicalModel!=null)?
            ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return  ElectricianDetailsItem(
                    // image:TechnicalCubit.get(context).technicalModel!.data![index].user!.avatar! ,
                    name: TechnicalCubit.get(context).technicalModel!.data![index].user!.name! ,
                    rate: TechnicalCubit.get(context).technicalModel!.data![index].user!.averageRating!,
                    price: TechnicalCubit.get(context).technicalModel!.data![index]!.user!.name!,
                    email: TechnicalCubit.get(context).technicalModel!.data![index]!.user!.email!,
                    phone:  TechnicalCubit.get(context).technicalModel!.data![index]!.user!.phoneNumber!,
                    address:  TechnicalCubit.get(context).technicalModel!.data![index]!.user!.address!,
                    image: TechnicalCubit.get(context).technicalModel!.data![index]!.user!.avatar!,
                    id: TechnicalCubit.get(context).technicalModel!.data![index]!.user!.id!,

                  );
                },
                separatorBuilder: (context,index){
                  return SizedBox(height: 14.h);
                },
                itemCount: TechnicalCubit.get(context).technicalModel!.data!.length,
            ):
                state is TechnicalErrorState?
            Text(state.err.toString()):const PostingShimmer(isText: false,);
      },
    );
  }
}
