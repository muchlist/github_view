import 'package:flutter/material.dart';
import 'package:github_view/auth/shared/providers.dart';
import 'package:github_view/github/core/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'paginated_repos_list_view.dart';

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
            )
          ],
        ),
        body: PaginatedReposListView());
  }
}


