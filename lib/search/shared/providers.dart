import 'package:github_view/core/shared/providers.dart';
import 'package:github_view/search/application/search_history_notifier.dart';
import 'package:github_view/search/infrastructure/search_history_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchHistoryRepositoryProvider = Provider(
  (ref) => SearchHistoryRepository(ref.watch(sembastprovider)),
);

final searchHistoryNotifierProvider =
    StateNotifierProvider<SearchHistoryNotifier, AsyncValue<List<String>>>(
  (ref) => SearchHistoryNotifier(ref.watch(searchHistoryRepositoryProvider)),
);
