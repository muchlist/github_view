import 'package:dio/dio.dart';
import 'package:github_view/auth/application/auth_notifier.dart';
import 'package:github_view/auth/infrastructure/github_authenticator.dart';

class OAuth2Interceptor extends Interceptor {
  final GithubAuthenticator _authenticator;
  final AuthNotifier _authNotifier;
  final Dio _dio;

  OAuth2Interceptor(this._authenticator, this._authNotifier, this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final credentials = await _authenticator.getSignedInCredentials();
    final modifiedOptions = options
      ..headers.addAll(
        credentials == null
            ? {}
            : {'Authorization': 'bearer ${credentials.accessToken}'},
      );
    handler.next(modifiedOptions);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final errorResponse = err.response;
    if (errorResponse != null && errorResponse.statusCode == 401) {
      final credentials = await _authenticator.getSignedInCredentials();

      credentials != null && credentials.canRefresh
          ? await _authenticator.refresh(credentials)
          : await _authenticator.clearCredentialsStorage();

      // trigger to login screen
      await _authNotifier.checkAndUpdateAuthStatus();

      final refreshCredentials = await _authenticator.getSignedInCredentials();
      if (refreshCredentials != null) {
        handler.resolve(
          await _dio.fetch(
            errorResponse.requestOptions..headers['Authorization'] = 'bearer $refreshCredentials',
          ),
        );
      }
    } else {
      handler.next(err);
    }
  }
}
