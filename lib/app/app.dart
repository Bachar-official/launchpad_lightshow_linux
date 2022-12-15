import 'package:flutter/material.dart';

import 'routing.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Launchpad Lightshow Creator',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
