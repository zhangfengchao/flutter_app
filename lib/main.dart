import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/tabbar/theme.dart';
import 'views/home/home.dart';
import 'views/digital/index.dart';
import 'views/user/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 初始化 WebView
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); // 锁定设备方向

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String homeRoute = "/";
  static const String businessRoute = "/business";
  static const String schoolRoute = "/school";

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: homeRoute,
      routes: {
        homeRoute: (context) => const HomePage(),
        businessRoute: (context) => const DigitalPage(),
        schoolRoute: (context) => const UserCenter(),
      },
      theme: ThemeData(
        primaryColor: Colors.orange, // 将主题颜色更改为橙色
        tabBarTheme: const TabBarTheme(
          indicator: BoxDecoration(
            color: Colors.orange,
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.orange, // 设置 AppBar 底色为橙色
        ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: MyCustomPageTransition(),
            TargetPlatform.iOS: MyCustomPageTransition(),
          },
        ),
      ),
      title: '云通数联',
    );
  }
}
