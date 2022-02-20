import 'package:auto_route/annotations.dart';
import 'package:github_view/auth/presentation/authorization_page.dart';
import 'package:github_view/auth/presentation/sign_in_page.dart';
import 'package:github_view/github/detail/presentation/repo_detail_page.dart';
import 'package:github_view/github/repos/search_repos/presentation/searched_repos_page.dart';
import 'package:github_view/github/repos/starred_repos/presentation/starred_repos_page.dart';
import 'package:github_view/splash/presentation/splash_page.dart';


@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage, path: '/sign-in'),
    MaterialRoute(page: AuthorizationPage, path: '/auth'),
    MaterialRoute(page: StarredReposPage, path: '/starred'),
    MaterialRoute(page: SearchedReposPage, path: '/search'),
    MaterialRoute(page: RepoDetailPage, path: '/detail'),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
