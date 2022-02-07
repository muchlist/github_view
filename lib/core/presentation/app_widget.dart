
import 'package:flutter/material.dart';
import 'package:github_view/core/presentation/routes/app_router.gr.dart';

class AppWidget extends StatelessWidget {
  final appRouter = AppRouter();

  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Github Viewer',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
