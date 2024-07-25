part of 'routes.dart';

class RouteName {
  static const String splash = "/";
  static const String home = "/home";
  static const String settings = "/settings";
  static const String about = "/about";
  static const String notFound = "/404";
}

final Map<String, WidgetBuilder> routes = {
  RouteName.splash: (context) => const SplashView(),
  RouteName.home: (context) => const HomeView(),
  RouteName.settings: (context) => const SettingsView(),
  RouteName.about: (context) => const AboutView(),
  RouteName.notFound: (context) => const PageNotFoundView(),
};
