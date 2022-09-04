import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRoutes{
  static const initialRoute = 'home';

  static final menuOptions = <MenuOptions> [
    MenuOptions(
      route: 'card',
      icon: Icons.credit_card,
      title: 'Card',
      screen: const CardScreen()
    ),
    MenuOptions(
      route: 'listview1',
      icon: Icons.list,
      title: 'List 1',
      screen: const ListView1Screen()
    ),
    MenuOptions(
      route: 'listview2',
      icon: Icons.list,
      title: 'List 2',
      screen: const ListView2Screen()
    ),
    MenuOptions(
      route: 'alert',
      icon: Icons.add_alert_outlined,
      title: 'Alert',
      screen: const AlertScreen()
    ),
    MenuOptions(
        route: 'avatar',
        icon: Icons.supervised_user_circle_outlined,
        title: 'Avatar',
        screen: const AvatarScreen()
    ),
    MenuOptions(
        route: 'animated',
        icon: Icons.play_circle_outline_outlined,
        title: 'Animated',
        screen: const AnimatedScreen()
    ),
    MenuOptions(
        route: 'input',
        icon: Icons.input_rounded,
        title: 'Input',
        screen: const InputScreen()
    ),
    MenuOptions(
        route: 'Sliders',
        icon: Icons.slideshow_rounded,
        title: 'Sliders',
        screen: const SlidersScreen()
    ),
    MenuOptions(
        route: 'listviewbuilder',
        icon: Icons.slideshow_rounded,
        title: 'List view Builder',
        screen: const ListViewBuilderScreen()
    ),

  ];

  static Map<String,Widget Function(BuildContext)> getAppRoutes(){
    Map<String,Widget Function(BuildContext)> routes = {};
    routes.addAll({'home':( BuildContext context) => const HomeScreen()});
    for (var menuOption in menuOptions) {
     routes.addAll({menuOption.route: (context) => menuOption.screen});
    }
    return routes;
  }

 /* static Map<String,Widget Function(BuildContext)> routes =
    {
      'home'      : (BuildContext context) => const HomeScreen(),
      'alert'     : (BuildContext context) => const AlertScreen(),
      'card'      : (BuildContext context) => const CardScreen(),
      'listview2' : (BuildContext context) => const ListView2Screen(),
      'listview1' : (BuildContext context) => const ListView1Screen(),
    };
  */

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
      return MaterialPageRoute(builder: (BuildContext context) => const AlertScreen());
    }
}
