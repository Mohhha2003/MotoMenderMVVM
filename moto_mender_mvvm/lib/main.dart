import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/core/api/dio_consumer.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';
import 'package:moto_mender_mvvm/cubits/store_cubit/store_cubit.dart';
import 'package:moto_mender_mvvm/repos/auth_repo.dart';
import 'package:moto_mender_mvvm/repos/store_repo.dart';
import 'package:moto_mender_mvvm/view_models/login_view_model.dart';
import 'view/screens/bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        BlocProvider(
            create: (context) =>
                StoreCubit(StoreRepo(api: DioConsumer(dio: Dio())))),
        BlocProvider(
            create: (context) =>
                AuthCubit(AuthRepo(api: DioConsumer(dio: Dio())))),
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
                  ? const BottomNavBarRoute()
                  : const LoginViewModel()),
        ),
      ),
    );
  }
}
