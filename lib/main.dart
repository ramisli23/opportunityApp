import 'package:opportunity1/router/app_router.dart';

import 'package:flutter/material.dart';
import 'package:opportunity1/cores/cores.dart';

void main() async {
  // Assure-toi que Firebase est bien initialisé
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      title: 'enlive',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
    );
  }
}
