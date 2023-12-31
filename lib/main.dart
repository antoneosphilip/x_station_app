
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/theme/themr.dart';
import 'package:x_station_app/utility/database/local/cache_helper.dart';
import 'package:x_station_app/utility/database/network/dio-helper.dart';
import 'package:x_station_app/view/screens/home_layout/home_layout.dart';
import 'package:x_station_app/view/screens/login/login_screen/login_screen.dart';
import 'package:x_station_app/view/screens/onboarding/onboarding_screen/onboarding_screen.dart';
import 'package:x_station_app/view/screens/splash/splash_screen/splash_screen.dart';
import 'package:x_station_app/view_model/block/add_faveorite_cubit/add_faveorite_cubit.dart';
import 'package:x_station_app/view_model/block/category_cubit/category_cubit.dart';
import 'package:x_station_app/view_model/block/forget_password_cubit/forget_password_cubit.dart';
import 'package:x_station_app/view_model/block/home_layout_cubit/home_layoout_cubit.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_cubit.dart';
import 'package:x_station_app/view_model/block/notification_cubit/notification_cubit.dart';
import 'package:x_station_app/view_model/block/notification_technician_cubit/notification_technician_cubit.dart';
import 'package:x_station_app/view_model/block/order_list_cubit/order_list_cubit.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_cubit.dart';
import 'package:x_station_app/view_model/block/profile_cubit/profile_cubit.dart';
import 'package:x_station_app/view_model/block/profile_cubit/profile_states.dart';
import 'package:x_station_app/view_model/block/search_cubit/search_cubit.dart';
import 'package:x_station_app/view_model/block/signup_cubit/signup_cubit.dart';
import 'package:x_station_app/view_model/block/technical_cubit/technical_cubit.dart';
import 'package:x_station_app/view_model/repo/add_faveorite_repo/add_favorite_repo.dart';
import 'package:x_station_app/view_model/repo/category_repo/category_repo.dart';
import 'package:x_station_app/view_model/repo/forget_password_repo/forget_password_repo.dart';
import 'package:x_station_app/view_model/repo/login_repo/login_repo.dart';
import 'package:x_station_app/view_model/repo/notification_Technician_repo/notification_Technician_repo.dart';
import 'package:x_station_app/view_model/repo/notification_repo/notification_repo.dart';
import 'package:x_station_app/view_model/repo/order_list_repo/order_list_repo.dart';
import 'package:x_station_app/view_model/repo/posts_repo/post_Repo.dart';
import 'package:x_station_app/view_model/repo/profile_repo/profile_repo.dart';
import 'package:x_station_app/view_model/repo/search_repo/search_repo.dart';
import 'package:x_station_app/view_model/repo/signup_repo/sigup_repo.dart';
import 'package:x_station_app/view_model/repo/technical_repo/technical_repo.dart';


import 'core/bloc_obsarver/bloc_obsarver.dart';
import 'core/color_manager/color_manager.dart';
import 'core/lang/language_service.dart';
import 'core/lang/translate.dart';
import 'core/route_manager/page_name.dart';
import 'core/route_manager/route_manager.dart';
import 'core/service_locator/service_locator.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getDataBool(key: 'isDark') ?? false;

  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
      'resource://drawable/ic_launcher',
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: ColorManager.colorPrimary,
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);


  Bloc.observer = MyBlocObserver();

  runApp(
       MyApp(isDark:isDark)
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>  , // Wrap your app
    // ),
  );
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({super.key, required this.isDark,});
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
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
              BlocProvider(create: (context) => ForgetPasswordCubit(sl.get<ForgetPasswordRepoImpl>())),
              BlocProvider(create: (context) => SignUpCubit(sl.get<SignUpRepoImpl>())),
              BlocProvider(create: (context) => ProfileCubit(sl.get<ProfileRepoImpl>())..getProfileData()..ChangeAppMode(FromShared: isDark)),
              BlocProvider(create: (context) => CategoryCubit(sl.get<CategoryRepoImpl>())..getCategory()..getCategorySelectMenu()),
              BlocProvider(create: (context) => TechnicalCubit(sl.get<TechnicalRepoImpl>())..getTechnicalList(id: 1)..getFavorite()),
              BlocProvider(create: (context) => PostsCubit(sl.get<PostsRepoImpl>())..getPosts()..showPost(id: 1)),
              BlocProvider(create: (context) => GetNotificationCubit(sl.get<GetNotificationRepoImpl>())..getNotification()..bindNotification()),
              BlocProvider(create: (context) => SearchCubit(sl.get<SearchRepoImpl>())),
              BlocProvider(create: (context) => OrderListCubit(sl.get<OrderListRepoImpl>())..getOrderList()),
              BlocProvider(create: (context) => GetNotificationTechnicianCubit(sl.get<GetNotificationTechnicianRepoImpl>())..getNotification()..bindNotification()),

            ],
            child: BlocConsumer<ProfileCubit,ProfileStates>(
              listener: (context,state){},
              builder: (context,state){
                return GetMaterialApp(
                  translations: WorldLanguage(), // your translations
                  locale: LanguageService()
                      .locale, //
                  useInheritedMediaQuery: true,
                  builder: EasyLoading.init(),
                  debugShowCheckedModeBanner: false,
                  initialRoute:
                  CacheHelper.getDataString(key: 'onBoarding')!=null&&
                      CacheHelper.getDataString(key: 'token')!=null?
                  PageName.homeLayout:
                  CacheHelper.getDataString(key: 'onBoarding')!=null&&
                      CacheHelper.getDataString(key: 'token')==null?
                  PageName.login:
                  CacheHelper.getDataString(key: 'onBoarding')==null&&
                      CacheHelper.getDataString(key: 'token')==null?
                  PageName.splash:PageName.splash,
                  getPages: pages,

                  // home:widget,
                  //  AnimatedSplashScreen(
                  //    splash: AssetsImage.onBoardingImage,splashIconSize: 200.sp,
                  //    nextScreen: const OnBoardingScreen(),
                  //    splashTransition: SplashTransition.rotationTransition,
                  //    duration: 3000,
                  //  ),
                  //  home: HomeScreen(),

                  theme: ProfileCubit.get(context).isDark?ThemeApp.dark:ThemeApp.light,

                );
              },
            ),
          );

        }
    );
  }
}

