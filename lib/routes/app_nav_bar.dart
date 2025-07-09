import 'package:flutter/material.dart';
import 'package:opportunity1/componets/components.dart';
import 'package:opportunity1/cores/cores.dart';
import 'package:opportunity1/modules/menus/courses_view.dart';
import 'package:opportunity1/modules/menus/home_view.dart';
import 'package:opportunity1/modules/menus/live_courses_view.dart';
import 'package:opportunity1/modules/menus/profile_view.dart';
import 'package:go_router/go_router.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({required this.child, Key? key})
    : super(key: key ?? const ValueKey<String>('AppNavBar'));

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    print("📍 Current route: $location"); // 🔍 Debug pour voir l'URL actuelle

    final List<String> hiddenBottomBarRoutes = [
      "/home/home_opportunity", // ✅ On ne cache QUE sur HomeOpportunity
    ];

    final bool hideBottomBar = hiddenBottomBarRoutes.any(
      (route) => location.startsWith(
        route,
      ), // 🔍 Vérifie uniquement si on est dans HomeOpportunity
    );

    print("🚨 Hide Bottom Bar: $hideBottomBar"); // 🔍 Debug

    return Scaffold(
      body: child,
      bottomNavigationBar:
          hideBottomBar
              ? null // ✅ Cacher la Bottom Bar
              : AppBottomBar(
                opacity: .2,
                currentIndex: _calculateSelectedIndex(location),
                onTap: (int? index) => _onTap(context, index ?? 0),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(23),
                ),
                elevation: 8,
                hasInk: true,
                items: _navigationItems,
              ),
    );
  }

  static const _navigationItems = <AppBottomBarItem>[
    AppBottomBarItem(
      icon: Icon(AppIcons.home),
      activeIcon: Icon(AppIcons.homeAlt),
      title: Text("Home"),
    ),
    AppBottomBarItem(
      icon: Icon(AppIcons.courses),
      activeIcon: Icon(AppIcons.coursesAlt),
      title: Text("Courses"),
    ),
    AppBottomBarItem(
      icon: Icon(AppIcons.live),
      activeIcon: Icon(AppIcons.liveAlt),
      title: Text("Live"),
    ),
    AppBottomBarItem(
      icon: Icon(AppIcons.profile),
      activeIcon: Icon(AppIcons.profileAlt),
      title: Text("Profile"),
    ),
  ];

  static int _calculateSelectedIndex(String location) {
    if (location.startsWith(HomeView.routeName)) return 0;
    if (location.startsWith(CoursesView.routeName)) return 1;
    if (location.startsWith(LiveCoursesView.routeName)) return 2;
    if (location.startsWith(ProfileView.routeName)) return 3;
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(HomeView.routeName);
        break;
      case 1:
        GoRouter.of(context).go(CoursesView.routeName);
        break;
      case 2:
        GoRouter.of(context).go(LiveCoursesView.routeName);
        break;
      case 3:
        GoRouter.of(context).go(ProfileView.routeName);
        break;
    }
  }
}
