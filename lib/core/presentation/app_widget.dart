import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_view/auth/application/auth_notifier.dart';
import 'package:github_view/auth/shared/providers.dart';
import 'package:github_view/core/presentation/routes/app_router.gr.dart';
import 'package:github_view/core/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final initializationProvider = FutureProvider<Unit>((ref) async {
  await ref.read(sembastprovider).init();
  ref.read(dioProvider)
    ..options = BaseOptions(
      headers: {
        'Accept': 'application/vnd.github.v3.html+json',
      },
      validateStatus: (status) =>
          status != null && status >= 200 && status < 400,
    )
    ..interceptors.add(
      ref.read(oauth2InterceptorProvider),
    );
  final authNotifier = ref.read(authNotifierProvider.notifier);
  await authNotifier.checkAndUpdateAuthStatus();
  return unit;
});

class AppWidget extends ConsumerWidget {
  final appRouter = AppRouter();

  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (_, __) {});

    ref.listen<AuthState>(authNotifierProvider, (_, state) {
      state.maybeMap(
          orElse: () {},
          authenticated: (_) {
            appRouter.pushAndPopUntil(
              const StarredReposRoute(),
              predicate: (route) => false,
            );
          },
          unauthenticated: (_) {
            appRouter.pushAndPopUntil(
              const SignInRoute(),
              predicate: (route) => false,
            );
          });
    });

    return MaterialApp.router(
      title: 'Repo Viewer',
      theme: _setupThemeData(),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }

  ThemeData _setupThemeData() {
    return ThemeData(
      primaryColor: Colors.grey.shade50,
    );
  }
}
