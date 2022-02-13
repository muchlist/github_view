import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:github_view/auth/shared/providers.dart';
import 'package:github_view/core/presentation/routes/app_router.gr.dart';
import 'package:github_view/github/core/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/presentation/paginated_repos_list_view.dart';

class StarredReposPage extends ConsumerStatefulWidget {
  const StarredReposPage({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<StarredReposPage> {
  @override
  void initState() {
    super.initState();
    ref.read(starredReposNotifierProvider.notifier).getNextStarredReposPage();
    // Future.microtask(() => context.read(starredReposNotifierProvider.notifier).getNextStarredReposPage());
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starred repos'),
        actions: [
          IconButton(
            icon: const Icon(MdiIcons.logoutVariant),
            onPressed: () {
              ref.read(authNotifierProvider.notifier).signOut();
            },
          ),
          IconButton(
            icon: const Icon(MdiIcons.magnify),
            onPressed: () {
              AutoRouter.of(context).push(SearchedReposRoute(searchTerm: 'flutter'));
            },
          )
        ],
      ),
      body: PaginatedReposListView(
        paginatedReposNotifierProvider: starredReposNotifierProvider,
        getNextPage: (ref) {
          ref.read(starredReposNotifierProvider.notifier).getNextStarredReposPage();
        },
        noResultMessage: "That's about everything we could find in your starred repos right now !",
      ),
    );
  }
}
