import 'package:github_view/github/repos/core/application/paginated_repos_notifier.dart';
import 'package:github_view/github/repos/starred_repos/infrastructure/starred_repos_repository.dart';


class StarredReposNotifier extends PaginatedReposNotifier {
  final StarredReposRepository _repository;

  StarredReposNotifier(this._repository);

  Future<void> getNextStarredReposPage() async {
    super.getNextPage((page) => _repository.getStarredReposPage(page));
  }
}
