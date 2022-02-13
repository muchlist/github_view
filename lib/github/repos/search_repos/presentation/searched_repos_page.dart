import 'package:flutter/material.dart';
import 'package:github_view/auth/shared/providers.dart';
import 'package:github_view/github/core/shared/providers.dart';
import 'package:github_view/github/repos/core/presentation/paginated_repos_list_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchedReposPage extends ConsumerStatefulWidget {
  final String searchTerm;

  const SearchedReposPage({ Key? key, required this.searchTerm }) : super(key: key);

  @override
  _SearchedReposPageState createState() => _SearchedReposPageState();
}

class _SearchedReposPageState extends ConsumerState<SearchedReposPage> {

  @override
  void initState() {
    super.initState();
    ref.read(searchReposNotifierProvider.notifier).getNextSearchedReposPage(widget.searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.searchTerm),
        actions: [
          IconButton(
            icon: const Icon(MdiIcons.logoutVariant),
            onPressed: () {
              ref.read(authNotifierProvider.notifier).signOut();
            },
          )
        ],
      ),
      body: PaginatedReposListView(
        paginatedReposNotifierProvider: starredReposNotifierProvider,
        getNextPage: (ref) {
          ref.read(searchReposNotifierProvider.notifier).getNextSearchedReposPage(widget.searchTerm);
        },
        noResultMessage: "This is all we could find for your search term. Really..",
      ),
    );
  }
}