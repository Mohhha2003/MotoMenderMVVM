import 'package:flutter/material.dart';

void navigationWithSlide(BuildContext context, Widget widget) {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0), // Slide from right to left
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  ));
}
