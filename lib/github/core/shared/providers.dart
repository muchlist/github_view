import 'package:github_view/core/shared/providers.dart';
import 'package:github_view/github/core/infrastructure/github_headers_cache.dart';
import 'package:github_view/github/detail/application/repo_detail_notifier.dart';
import 'package:github_view/github/detail/infrastructure/repo_detail_local_service.dart';
import 'package:github_view/github/detail/infrastructure/repo_detail_remote_service.dart';
import 'package:github_view/github/detail/infrastructure/repo_detail_repository.dart';
import 'package:github_view/github/repos/core/application/paginated_repos_notifier.dart';
import 'package:github_view/github/repos/search_repos/applicaton/searched_repos_notifier.dart';
import 'package:github_view/github/repos/search_repos/infrastructure/search_repos_repository.dart';
import 'package:github_view/github/repos/search_repos/infrastructure/searched_repos_remote_service.dart';
import 'package:github_view/github/repos/starred_repos/application/starred_repos_notifier.dart';
import 'package:github_view/github/repos/starred_repos/infrastructure/starred_repos_local_service.dart';
import 'package:github_view/github/repos/starred_repos/infrastructure/starred_repos_remote_service.dart';
import 'package:github_view/github/repos/starred_repos/infrastructure/starred_repos_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final githubHeadersCacheProvider = Provider(
  (ref) => GithubHeadersCache(
    ref.watch(sembastprovider),
  ),
);

final starredReposLocalServiceProvider = Provider(
  (ref) => StarredReposLocalService(
    ref.watch(sembastprovider),
  ),
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

final starredReposNotifierProvider = StateNotifierProvider.autoDispose<
    StarredReposNotifier, PaginatedReposState>(
  (ref) => StarredReposNotifier(
    ref.watch(starredReposRepositoryProvider),
  ),
);

final searchedReposRemoteServiceProvider = Provider(
  (ref) => SearchedReposRemoteService(
    ref.watch(dioProvider),
    ref.watch(githubHeadersCacheProvider),
  ),
);

final searchedReposRepositoryProvider = Provider(
  (ref) => SearchedReposRepository(
    ref.watch(searchedReposRemoteServiceProvider),
  ),
);

final searchReposNotifierProvider = StateNotifierProvider.autoDispose<
    SearchedReposNotifier, PaginatedReposState>(
  (ref) => SearchedReposNotifier(
    ref.watch(searchedReposRepositoryProvider),
  ),
);

final repoDetailLocalServiceProvider = Provider(
  (ref) => RepoDetailLocalService(
    ref.watch(sembastprovider),
    ref.watch(githubHeadersCacheProvider),
  ),
);

final repoDetailRemoteServiceProvider = Provider(
  (ref) => RepoDetailRemoteService(
    ref.watch(dioProvider),
    ref.watch(githubHeadersCacheProvider),
  ),
);

final repoDetailRepositoryProvider = Provider(
  (ref) => RepoDetailRepository(
    ref.watch(repoDetailLocalServiceProvider),
    ref.watch(repoDetailRemoteServiceProvider),
  ),
);

final repoDetailNotifierProvider =
    StateNotifierProvider.autoDispose<RepoDetailNotifier, RepoDetailState>(
  (ref) => RepoDetailNotifier(
    ref.watch(repoDetailRepositoryProvider),
  ),
);
