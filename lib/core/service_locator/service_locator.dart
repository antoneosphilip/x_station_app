



import 'package:get_it/get_it.dart';
import 'package:x_station_app/view_model/block/add_faveorite_cubit/add_faveorite_cubit.dart';
import 'package:x_station_app/view_model/block/technical_cubit/technical_cubit.dart';
import 'package:x_station_app/view_model/repo/add_faveorite_repo/add_favorite_repo.dart';
import 'package:x_station_app/view_model/repo/category_repo/category_repo.dart';
import 'package:x_station_app/view_model/repo/forget_password_repo/forget_password_repo.dart';
import 'package:x_station_app/view_model/repo/order_list_repo/order_list_repo.dart';
import 'package:x_station_app/view_model/repo/posts_repo/post_Repo.dart';
import 'package:x_station_app/view_model/repo/profile_repo/profile_repo.dart';
import 'package:x_station_app/view_model/repo/search_repo/search_repo.dart';
import 'package:x_station_app/view_model/repo/signup_repo/sigup_repo.dart';
import 'package:x_station_app/view_model/repo/technical_repo/technical_repo.dart';

import '../../view_model/repo/login_repo/login_repo.dart';
import '../../view_model/repo/notification_Technician_repo/notification_Technician_repo.dart';
import '../../view_model/repo/notification_repo/notification_repo.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl());
  sl.registerLazySingleton<ForgetPasswordRepoImpl>(() => ForgetPasswordRepoImpl());
  sl.registerLazySingleton<SignUpRepoImpl>(() => SignUpRepoImpl());
  sl.registerLazySingleton<CategoryRepoImpl>(() => CategoryRepoImpl());
  sl.registerLazySingleton<ProfileRepoImpl>(() => ProfileRepoImpl());
  sl.registerLazySingleton<PostsRepoImpl>(() => PostsRepoImpl());
  sl.registerLazySingleton<TechnicalRepoImpl>(() => TechnicalRepoImpl());

  sl.registerLazySingleton<GetNotificationRepoImpl>(() => GetNotificationRepoImpl());
  sl.registerLazySingleton<SearchRepoImpl>(() => SearchRepoImpl());
  sl.registerLazySingleton<OrderListRepoImpl>(() => OrderListRepoImpl());
  sl.registerLazySingleton<GetNotificationTechnicianRepoImpl>(() => GetNotificationTechnicianRepoImpl());

  // sl.registerLazySingleton<AddFavoriteRepoImpl>(() => AddFavoriteRepoImpl());


  // cubit
}
