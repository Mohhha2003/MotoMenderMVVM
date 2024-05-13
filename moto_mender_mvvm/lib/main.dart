import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/core/api/dio_consumer.dart';
import 'package:moto_mender_mvvm/core/get_it/get_it.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';
import 'package:moto_mender_mvvm/cubits/store_cubit/store_cubit.dart';
import 'package:moto_mender_mvvm/repos/auth_repo.dart';
import 'package:moto_mender_mvvm/repos/cart_repo.dart';
import 'package:moto_mender_mvvm/repos/favorites_repo.dart';
import 'package:moto_mender_mvvm/repos/store_repo.dart';
import 'package:moto_mender_mvvm/repos/support_service_repo.dart';
import 'package:moto_mender_mvvm/view/screens/introduction_view.dart';
import 'package:moto_mender_mvvm/view_models/cart_view/cubit/cart_cubit_cubit.dart';
import 'package:moto_mender_mvvm/view_models/favorties/cubit/favorites_cubit.dart';
import 'package:moto_mender_mvvm/view_models/support_view_model/cubit/chat_cubit.dart';
import 'package:moto_mender_mvvm/view_models/support_view_model/support_view_model.dart';
import 'view_models/bottom_nav_bar_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  await CacheHelper().init();
  await CacheHelper().isUserSaved();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StoreCubit(getIt<StoreRepo>())),
        BlocProvider(
            create: (context) =>
                AuthCubit(AuthRepo(api: getIt<DioConsumer>()))),
        BlocProvider(
            create: (context) =>
                CartCubit(CartRepo(api: getIt<DioConsumer>()))),
        BlocProvider(
          create: (context) =>
              FavoritesCubit(FavoritesRepo(api: getIt<DioConsumer>())),
        ),
        BlocProvider(
          create: (context) =>
              ChatCubit(SupportServiceRepo(api: getIt<DioConsumer>())),
          child: const SupportViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            //    BOTTOM NAVBAR THEME
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Color(0xff34D49E),
                selectedLabelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff34D49E),
                ),
                unselectedLabelStyle: TextStyle(
                  color: Color(0xffBDBDBD),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                unselectedItemColor: Color(0xffBDBDBD)),

            //   FONTS THEME
            fontFamily: GoogleFonts.amiko().fontFamily,
            textTheme: const TextTheme(
              labelSmall: TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
              labelMedium: TextStyle(
                  color: Color(0xff34D49E),
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
              displaySmall: TextStyle(
                  color: Color(0xffAEAEAE),
                  fontWeight: FontWeight.w700,
                  fontSize: 9),
              bodySmall: TextStyle(color: Color(0xffFFFFFF)),
              bodyLarge: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
              titleLarge: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              displayLarge: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff172B4D)),
              displayMedium: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff7A869A)),
              headlineLarge: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color(0xff7A869A)),
            )),
        home: Scaffold(
          body: SafeArea(
              child: CacheHelper.rememberMe
                  ? const BottomNavBarViewModel()
                  : const IntroductionView()),
        ),
      ),
    );
  }
}
