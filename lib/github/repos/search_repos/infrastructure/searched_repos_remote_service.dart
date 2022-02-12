import 'package:dio/dio.dart';
import 'package:github_view/core/infrastructure/remote_response.dart';
import 'package:github_view/github/core/infrastructure/github_headers_cache.dart';
import 'package:github_view/github/core/infrastructure/github_repo_dto.dart';
import 'package:github_view/github/core/infrastructure/pagination_config.dart';
import 'package:github_view/github/repos/core/infrastructure/repos_remote_service.dart';

class SearchReposRemoteService extends ReposRemoteService {
  SearchReposRemoteService(
    Dio dio,
    GithubHeadersCache headersCache,
  ) : super(dio, headersCache);

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
    String query,
    int page,
  ) async =>
      super.getPage(
          requestUri: Uri.https(
            'api.github.com',
            '/search/repositories',
            {
              'q': query,
              'page': '$page',
              'per_page': PaginationConfig.itemsPerPage.toString(),
            },
          ),
          jsonDataSelector: (json) => json['items'] as List<dynamic>);
}
