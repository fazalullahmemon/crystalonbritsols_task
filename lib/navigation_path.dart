import 'package:crystalonbritsols_task/screens/home/home_screen.dart';
import 'package:crystalonbritsols_task/screens/home/uses_screen.dart';
import 'package:crystalonbritsols_task/screens/login/login_screen.dart';
import 'package:flutter/animation.dart';

import 'package:get/get.dart';

class NavigationPath {
  NavigationPath._();

  static const Duration defaultDuration = Duration(milliseconds: 300);
  static const _defaultCurve = Curves.easeInQuad;
  static const Transition defaultTransition = Transition.rightToLeft;

  static const String loginScreen = "/LoginScreen";
  static const String homeScreen = "/HomeScreen";
  static const String usersScreen = "/UsersScreen";

  static List<GetPage<dynamic>>? pages = [
    GetPage(
        name: loginScreen,
        page: () => const LoginScreen(),
        curve: _defaultCurve),
    GetPage(
        name: homeScreen, page: () => const HomeScreen(), curve: _defaultCurve),
    GetPage(
        name: usersScreen,
        page: () => const UsersScreen(),
        curve: _defaultCurve),
  ];
}
