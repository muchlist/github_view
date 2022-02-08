import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:github_view/auth/application/auth_notifier.dart';
import 'package:github_view/auth/shared/providers.dart';
import 'package:github_view/core/presentation/routes/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final initializationProvider = FutureProvider<Unit>((ref) async {
  final authNotifier = ref.watch(authNotifierProvider.notifier);
  await authNotifier.checkAndUpdateAuthStatus();
  return unit;
});

class AppWidget extends StatelessWidget {
  final appRouter = AppRouter();

  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: initializationProvider,
      onChange: (context, _, __) {},
      child: ProviderListener<AuthState>(
        provider: authNotifierProvider,
        onChange: (context, _, state) {
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
        },
        child: MaterialApp.router(
          title: 'Repo Viewer',
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}
