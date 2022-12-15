import 'package:flutter/material.dart';

import '../feature/home/home_screen.dart';

class AppRouter {
  static const homeScreen = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return _buildRoute((context) => const HomeScreen(), settings);
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}

MaterialPageRoute _buildRoute(WidgetBuilder builder, settings) {
  return MaterialPageRoute(settings: settings, builder: builder);
}

class Explorer {
  static void goToInitialPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRouter.homeScreen);
  }

  static void goToPage(context, path, {dynamic prop, Function? callback}) {
    Navigator.pushNamed(context, path, arguments: prop).then((value) => {
          if (callback != null)
            {
              callback(),
            }
        });
  }
}
