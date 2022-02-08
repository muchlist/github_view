import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:github_view/auth/application/auth_notifier.dart';
import 'package:github_view/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:github_view/auth/infrastructure/credentials_storage/secure_credentials_storage.dart';
import 'package:github_view/auth/infrastructure/github_authenticator.dart';
import 'package:riverpod/riverpod.dart';

final flutterSecureStorageProvider =
    Provider((ref) => const FlutterSecureStorage());

final dioProvider = Provider((ref) => Dio());

// use CredentialsStorage abstraction because we need to mock
final credentialStorageProvider = Provider<CredentialsStorage>(
  (ref) => SecureCredentialsStorage(ref.watch(flutterSecureStorageProvider)),
);

final githubAuthenticatorprovider = Provider(
  (ref) => GithubAuthenticator(
    ref.watch(credentialStorageProvider),
    ref.watch(dioProvider),
  ),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(githubAuthenticatorprovider))
);