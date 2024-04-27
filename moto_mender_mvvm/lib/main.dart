import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moto_mender_mvvm/view/screens/login_view.dart';
import 'package:moto_mender_mvvm/view/screens/product_view.dart';

import 'view/screens/store_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        body: SafeArea(child: LoginView()),
      ),
    );
  }
}
