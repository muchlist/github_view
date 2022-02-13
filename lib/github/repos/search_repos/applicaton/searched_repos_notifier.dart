import 'package:github_view/github/repos/core/application/paginated_repos_notifier.dart';
import 'package:github_view/github/repos/search_repos/infrastructure/search_repos_repository.dart';


class SearchedReposNotifier extends PaginatedReposNotifier {
  final SearchedReposRepository _repository;

  SearchedReposNotifier(this._repository);

  Future<void> getNextSearchedReposPage(String query) async {
    super.getNextPage((page) => _repository.getSearchedReposPage(query, page));
  }
}
