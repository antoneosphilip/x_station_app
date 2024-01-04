import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_station_app/view/screens/home/home_widget/posting_shimmer/posting_shimmer.dart';
import 'package:x_station_app/view_model/block/add_faveorite_cubit/add_faveorite_cubit.dart';
import 'package:x_station_app/view_model/block/add_faveorite_cubit/add_faveorite_states.dart';
import 'package:x_station_app/view_model/block/technical_cubit/technical_cubit.dart';
import 'package:x_station_app/view_model/block/technical_cubit/technical_states.dart';

import '../../../../../view_model/block/search_cubit/search_cubit.dart';
import '../../../electrican_details/eletrician_details_widget/electrician_details_item/electrician_details_item.dart';
import '../faveoritelist_item/faveorite_list_item.dart';


class FavoriteListView extends StatelessWidget {
  const FavoriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    TechnicalCubit.get(context).getFavorite();
    return BlocConsumer<TechnicalCubit,TechnicalStates>(
      listener: (context,state){
      },
      builder: (context,state){

        return state is GetFavoriteLoadingState?
        const PostingShimmer(isText: false,)
        :
        (TechnicalCubit.get(context).getFavoriteModel!=null)?
        ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return ElectricianDetailsItem(
                name: TechnicalCubit.get(context).getFavoriteModel!.data![index].name!,
                phone: TechnicalCubit.get(context).getFavoriteModel!.data![index].phoneNumber!,
                address: TechnicalCubit.get(context).getFavoriteModel!.data![index].address!,
                price:TechnicalCubit.get(context).getFavoriteModel!.data![index].salary!,
                rate: TechnicalCubit.get(context).getFavoriteModel!.data![index].averageRating!,
                email: TechnicalCubit.get(context).getFavoriteModel!.data![index].email!,
                image: '',
                id: TechnicalCubit.get(context).getFavoriteModel!.data![index].id!,
              );
            },
            separatorBuilder: (context,index){
              return SizedBox(height: 25.h);
            },
            itemCount: TechnicalCubit.get(context).getFavoriteModel!.data!.length
        ):const PostingShimmer(isText: false,);
      },
    );
  }
}
