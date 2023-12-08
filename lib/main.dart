
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/theme/themr.dart';
import 'package:x_station_app/utility/database/local/cache_helper.dart';
import 'package:x_station_app/utility/database/network/dio-helper.dart';
import 'package:x_station_app/view/screens/onboarding/onboarding_screen/onboarding_screen.dart';
import 'package:x_station_app/view_model/block/forget_password_cubit/forget_password_cubit.dart';
import 'package:x_station_app/view_model/block/home_layout_cubit/home_layoout_cubit.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_cubit.dart';
import 'package:x_station_app/view_model/repo/forget_password_repo/forget_password_repo.dart';
import 'package:x_station_app/view_model/repo/login_repo/login_repo.dart';


import 'core/bloc_obsarver/bloc_obsarver.dart';
import 'core/route_manager/page_name.dart';
import 'core/route_manager/route_manager.dart';
import 'core/service_locator/service_locator.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => HomeLayoutCubit(),),
              BlocProvider(create: (context) => ForgetPasswordCubit(sl.get<ForgetPasswordRepoImpl>()))

            ],
            child: GetMaterialApp(
              locale: const Locale('en'),
              useInheritedMediaQuery: true,
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              initialRoute: PageName.splash,
              title: 'Everest',
              getPages: pages,
              // home:  AnimatedSplashScreen(
              //    splash: AssetsImage.onBoardingImage,splashIconSize: 200.sp,
              //    nextScreen: const OnBoardingScreen(),
              //    splashTransition: SplashTransition.rotationTransition,
              //    duration: 3000,
              //  ),
            //  home: HomeScreen(),
              theme: ThemeApp.light
            ),
          );

        }
    );
  }
}

