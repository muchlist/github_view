import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:github_view/auth/shared/providers.dart';
import 'package:github_view/core/presentation/routes/app_router.gr.dart';
import 'package:github_view/github/core/shared/providers.dart';
import 'package:github_view/github/repos/core/presentation/paginated_repos_list_view.dart';
import 'package:github_view/search/presentation/search_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchedReposPage extends ConsumerStatefulWidget {
  final String searchTerm;

  const SearchedReposPage({Key? key, required this.searchTerm})
      : super(key: key);

  @override
  _SearchedReposPageState createState() => _SearchedReposPageState();
}

class _SearchedReposPageState extends ConsumerState<SearchedReposPage> {
  @override
  void initState() {
    super.initState();
    ref
        .read(searchReposNotifierProvider.notifier)
        .getFirstSearchedReposPage(widget.searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBar(
        title: widget.searchTerm,
        hint: 'Search all repositories...',
        onShouldNavigateToResultPage: (seachTerm) {
          AutoRouter.of(context).pushAndPopUntil(
              SearchedReposRoute(searchTerm: seachTerm),
              predicate: (route) =>
                  route.settings.name == StarredReposRoute.name);
        },
        onSignOutButtonPress: () {
          ref.read(authNotifierProvider.notifier).signOut();
        },
        body: PaginatedReposListView(
          paginatedReposNotifierProvider: searchReposNotifierProvider,
          getNextPage: (ref) {
            ref
                .read(searchReposNotifierProvider.notifier)
                .getNextSearchedReposPage(widget.searchTerm);
          },
          noResultMessage:
              "This is all we could find for your search term. Really..",
        ),
      ),
    );
  }
}
