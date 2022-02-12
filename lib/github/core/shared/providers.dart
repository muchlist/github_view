import 'package:github_view/core/shared/providers.dart';
import 'package:github_view/github/core/infrastructure/github_headers_cache.dart';
import 'package:github_view/github/repos/starred_repos/application/starred_repos_notifier.dart';
import 'package:github_view/github/repos/starred_repos/infrastructure/starred_repos_local_service.dart';
import 'package:github_view/github/repos/starred_repos/infrastructure/starred_repos_remote_service.dart';
import 'package:github_view/github/repos/starred_repos/infrastructure/starred_repos_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final githubHeadersCacheProvider = Provider(
  (ref) => GithubHeadersCache(ref.watch(sembastprovider)),
);

final starredReposLocalServiceProvider = Provider(
  (ref) => StarredReposLocalService(ref.watch(sembastprovider)),
);

final starredReposRemoteServiceProvider = Provider(
  (ref) => StarredReposRemoteService(
    ref.watch(dioProvider),
    ref.watch(githubHeadersCacheProvider),
  ),
);

final starredReposRepositoryProvider = Provider(
  (ref) => StarredReposRepository(
    ref.watch(starredReposRemoteServiceProvider),
    ref.watch(starredReposLocalServiceProvider),
  ),
);

final starredReposNotifierProvider =
    StateNotifierProvider<StarredReposNotifier, StarredReposState>(
  (ref) => StarredReposNotifier(ref.watch(starredReposRepositoryProvider)),
);