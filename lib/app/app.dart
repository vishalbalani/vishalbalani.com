import 'package:flutter/material.dart';
import 'package:vishalbalani/app/routes.dart';
import 'package:vishalbalani/resources/theme.dart';
import 'package:vishalbalani/src/features/page_not_found/presentation/page_not_found_view.dart';

class MyApp extends StatelessWidget {
  const MyApp._(); // Private constructor
  static const MyApp instance = MyApp._(); // Singleton instance

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      title: "Vishal Balani",
      routes: routes,
      initialRoute: RouteName.splash,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const PageNotFoundView(),
        );
      },
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
    );
  }
}
