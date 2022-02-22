import 'package:github_view/search/infrastructure/search_history_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// AsyncValue adalah freezed union class bawaan riverpod yang bisa kita gunakan untuk
/// menangani tipe tipe asyncronus
class SearchHistoryNotifier extends StateNotifier<AsyncValue<List<String>>> {
  final SearchHistoryRepository _repository;

  SearchHistoryNotifier(this._repository) : super(const AsyncValue.loading());

  void watchSearchTerms({String? filter}) {
    _repository.watchSearchTerms(filter: filter).listen(
      (data) {
        state = AsyncValue.data(data);
      },
      onError: (Object error) {
        state = AsyncValue.error(error);
        // throw error;
      },
    );
  }

  Future<void> addSearchTerm(String term) => _repository.addSearchTerm(term);
  Future<void> deleteSearchTerm(String term) => _repository.deleteSearchTerm(term);
  Future<void> putSearchTermFirst(String term) => _repository.putSearchTermFirst(term);
}
