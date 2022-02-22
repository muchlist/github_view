import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_view/core/domain/fresh.dart';
import 'package:github_view/github/core/domain/github_failure.dart';
import 'package:github_view/github/detail/domain/github_repo_detail.dart';
import 'package:github_view/github/detail/infrastructure/repo_detail_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'repo_detail_notifier.freezed.dart';

@freezed
class RepoDetailState with _$RepoDetailState {
  const RepoDetailState._();

  const factory RepoDetailState.initial({
    @Default(false) bool hasStarredStatuschange,
  }) = _Initial;

  const factory RepoDetailState.loadInProggress({
    @Default(false) bool hasStarredStatuschange,
  }) = _LoadInProggress;

  const factory RepoDetailState.loadSuccess(
    Fresh<GithubRepoDetail?> repoDetail, {
    @Default(false) bool hasStarredStatuschange,
  }) = _LoadSuccess;

  const factory RepoDetailState.loadFailure(
    GithubFailure failure, {
    @Default(false) bool hasStarredStatuschange,
  }) = _LoadFailure;
}

class RepoDetailNotifier extends StateNotifier<RepoDetailState> {
  final RepoDetailRepository _repository;

  RepoDetailNotifier(this._repository) : super(const RepoDetailState.initial());

  Future<void> getRepoDetail(String fullRepoName) async {
    state = const RepoDetailState.loadInProggress();
    final failureOrRepoDetail = await _repository.getRepeDetail(fullRepoName);
    state = failureOrRepoDetail.fold(
      (l) => RepoDetailState.loadFailure(l),
      (r) => RepoDetailState.loadSuccess(r),
    );
  }

  // Optimistic update example
  Future<void> switchStarredStatus(GithubRepoDetail repoDetail) async {
    state.maybeMap(
      orElse: () {},
      loadSuccess: (successState) async {
        final stateCopy = successState.copyWith();
        final repoDetail = successState.repoDetail.entity;
        if (repoDetail != null) {
          state = successState.copyWith.repoDetail(
            entity: repoDetail.copyWith(starred: !repoDetail.starred),
          );
          final failureOrSuccess =
              await _repository.switchStarredStatus(repoDetail);
          failureOrSuccess.fold(
            (l) => state = stateCopy,
            (r) => r == null
                ? state = stateCopy
                : state = state.copyWith(hasStarredStatuschange: true),
          );
        }
      },
    );
  }
}
