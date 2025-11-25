import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/core/themes/app_theme.dart';
import 'package:rick_and_morty_app/di.dart' as di;
import 'package:rick_and_morty_app/router/app_router.dart';

void main() {
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme().light(),
      routerConfig: appRouter,
    );
  }
}
