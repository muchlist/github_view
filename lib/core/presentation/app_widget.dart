
import 'package:flutter/material.dart';
import 'package:github_view/splash/presentation/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Github Viewer',
      home: SplashPage(),
    );
  }
}
