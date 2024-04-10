import 'package:dent_o_doctor/screens/DashBoardScreen.dart';
import 'package:dent_o_doctor/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final routes = GoRouter(
  // /*navigatorKey: _rootNavigatorKey,*/
  initialLocation: "/",
  // observers: [
  //   GoRouterObserver(),
  // ],
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/Dashboard",
      builder: (context, state) => const DashBoardScreen(),
    ),
  ],
);
