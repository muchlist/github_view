import 'package:dartz/dartz.dart';
import 'package:github_view/core/domain/fresh.dart';
import 'package:github_view/core/infrastructure/network_exceptions.dart';
import 'package:github_view/github/core/domain/github_failure.dart';
import 'package:github_view/github/detail/domain/github_repo_detail.dart';
import 'package:github_view/github/detail/infrastructure/github_repo_detail_dto.dart';
import 'package:github_view/github/detail/infrastructure/repo_detail_local_service.dart';
import 'package:github_view/github/detail/infrastructure/repo_detail_remote_service.dart';

class RepoDetailRepository {
  final RepoDetailLocalService _localService;
  final RepoDetailRemoteService _remoteService;

  RepoDetailRepository(this._localService, this._remoteService);

  Future<Either<GithubFailure, Fresh<GithubRepoDetail?>>> getRepeDetail(
      String fullRepoName) async {
    try {
      final htmlRemoteResponse =
          await _remoteService.getReadmeHtml(fullRepoName);
      return right(await htmlRemoteResponse.when(
        noConnection: () async {
          return Fresh.no(await _localService
              .getRepoDetail(fullRepoName)
              .then((dto) => dto?.toDomain()));
        },
        notModified: (_) async {
          final cached = await _localService.getRepoDetail(fullRepoName);
          final starred = await _remoteService.getStarredStatus(fullRepoName);
          final withUpdatedStarredField =
              cached?.copyWith(starred: starred ?? false);
          return Fresh.yes(withUpdatedStarredField?.toDomain());
        },
        withNewData: (html, _) async {
          final starred = await _remoteService.getStarredStatus(fullRepoName);
          final dto = GithubRepoDetailDTO(
            fullName: fullRepoName,
            html: html,
            starred: starred ?? false,
          );
          await _localService.upsertRepoDetail(dto);
          return Fresh.yes(dto.toDomain());
        },
      ));
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }

  // return right null if no internet connection
  Future<Either<GithubFailure, Unit?>> switchStarredStatus(
    GithubRepoDetail repoDetail,
  ) async {
    try {
      final actionCompleted = await _remoteService.swithhStarredStatus(
          repoDetail.fullName,
          isCurrentlyStarred: repoDetail.starred);
      return right(actionCompleted);
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}
