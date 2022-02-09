import 'package:dio/dio.dart';
import 'package:github_view/core/infrastructure/network_exceptions.dart';
import 'package:github_view/core/infrastructure/remote_response.dart';
import 'package:github_view/github/core/infrastructure/github_headers.dart';
import 'package:github_view/github/core/infrastructure/github_headers_cache.dart';
import 'package:github_view/github/core/infrastructure/github_repo_dto.dart';
import 'package:github_view/core/infrastructure/dio_extensions.dart';

class StarredReposRemoteService {
  final Dio _dio;
  final GithubHeadersCache _headersCache;

  StarredReposRemoteService(this._dio, this._headersCache);

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
    int page,
  ) async {
    final token = 'asdasdadasdasd';
    final accept = 'asdasdadasdasd';
    _dio.get('');
    final requestUri =
        Uri.https('api.github.com', '/user/starred', {'page': '$page'});

    final previousHeaders = await _headersCache.getHeaders(requestUri);

    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          headers: {
            'Authorization': 'bearer $token',
            'Accept': accept,
            'If-None-Match': previousHeaders?.etag ?? '',
          },
        ),
      );

      if (response.statusCode == 304) {
        return RemoteResponse.notModified(
            maxPage: previousHeaders?.link?.maxPage ?? 0);
      }
      if (response.statusCode == 200) {
        final headers = GithubHeaders.parse(response);

        headers.link?.maxPage;

        await _headersCache.saveHeaders(requestUri, headers);

        final convertedData = (response.data as List<dynamic>)
            .map((e) => GithubRepoDTO.fromJson(e as Map<String, dynamic>))
            .toList();
        return RemoteResponse.withNewData(
          convertedData,
          // maxpage ?? 1 because response github can be null link, and pagi will be one
          maxPage: headers.link?.maxPage ?? 1, 
        );
      } else {
        throw RestApiException(response.statusCode);
      }

    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return RemoteResponse.noConnection(
            maxPage: previousHeaders?.link?.maxPage ?? 0);
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
