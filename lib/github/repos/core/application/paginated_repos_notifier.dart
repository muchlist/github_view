import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_view/core/domain/fresh.dart';
import 'package:github_view/github/core/domain/github_failure.dart';
import 'package:github_view/github/core/domain/github_repo.dart';
import 'package:github_view/github/core/infrastructure/pagination_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'paginated_repos_notifier.freezed.dart';

typedef RepositoryGetter = Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> Function(int page);

@freezed
class PaginatedReposState with _$PaginatedReposState {
  const PaginatedReposState._();

  const factory PaginatedReposState.initial(
    Fresh<List<GithubRepo>> repos,
  ) = _Initial;

  const factory PaginatedReposState.loadInProgress(
    Fresh<List<GithubRepo>> repos,
    int itemsPerPage,
  ) = _LoadInProgress;

  const factory PaginatedReposState.loadSuccess(
    Fresh<List<GithubRepo>> repos, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;

  const factory PaginatedReposState.loadFailure(
    Fresh<List<GithubRepo>> repos,
    GithubFailure failure,
  ) = _LoadFailure;
}

class PaginatedReposNotifier extends StateNotifier<PaginatedReposState> {
  PaginatedReposNotifier() : super(PaginatedReposState.initial(Fresh.yes([])));

  int _page = 1;

  @protected
  Future<void> getNextPage(
    RepositoryGetter getter
  ) async {
    state = PaginatedReposState.loadInProgress(
      state.repos,
      PaginationConfig.itemsPerPage,
    );

    final failureOrRepos = await getter(_page);
    state = failureOrRepos.fold(
      (l) => PaginatedReposState.loadFailure(state.repos, l),
      (r) {
        _page++;
        return PaginatedReposState.loadSuccess(
          r.copyWith(entity: [
            ...state.repos.entity,
            ...r.entity,
          ]),
          isNextPageAvailable: r.isNextPageAvailable ?? false,
        );
      },
    );
  }
}
