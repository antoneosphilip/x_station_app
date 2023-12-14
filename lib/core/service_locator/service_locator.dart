



import 'package:get_it/get_it.dart';
import 'package:x_station_app/view_model/repo/forget_password_repo/forget_password_repo.dart';
import 'package:x_station_app/view_model/repo/signup_repo/sigup_repo.dart';

import '../../view_model/repo/login_repo/login_repo.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl());
  sl.registerLazySingleton<ForgetPasswordRepoImpl>(() => ForgetPasswordRepoImpl());
  sl.registerLazySingleton<SignUpRepoImpl>(() => SignUpRepoImpl());

  // cubit
}
