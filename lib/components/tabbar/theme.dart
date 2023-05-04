import 'package:flutter/material.dart';

class MyCustomPageTransition<T> extends PageTransitionsBuilder {
  @override
  // ignore: avoid_shadowing_type_parameters
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (route.isFirst) {
      return child; // 无动画效果
    }

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOutQuart, // 设置动画曲线
      )),
      child: child,
    );
  }
}
