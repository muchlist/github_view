import 'package:flutter/material.dart';
import 'package:github_view/github/core/shared/providers.dart';
import 'package:github_view/github/repos/starred_repos/application/starred_repos_notifier.dart';
import 'package:github_view/github/repos/starred_repos/presentation/repo_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'failure_repo_tile.dart';
import 'loading_repo_tile.dart';

class PaginatedReposListView extends StatefulWidget {
  const PaginatedReposListView({
    Key? key,
  }) : super(key: key);

  @override
  State<PaginatedReposListView> createState() => _PaginatedReposListViewState();
}

class _PaginatedReposListViewState extends State<PaginatedReposListView> {
  bool canLoadNextPage = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      ref.listen<StarredReposState>(starredReposNotifierProvider,
          (previous, next) {
        next.map(
          initial: (s) => canLoadNextPage = true,
          loadInProgress: (s) => canLoadNextPage = false,
          loadSuccess: (s) => canLoadNextPage = s.isNextPageAvailable,
          loadFailure: (s) => canLoadNextPage = false,
        );
      });
      final state = ref.watch(starredReposNotifierProvider);
      return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          final metric = notification.metrics;
          final limit = metric.maxScrollExtent - metric.viewportDimension / 3 ;
          
          if (canLoadNextPage && metric.pixels >= limit){
            canLoadNextPage = false;
            ref.read(starredReposNotifierProvider.notifier).getNextStarredReposPage();
          }
        
          return false;
        },
          child: _PaginatedListView(state: state));
    }));
  }
}

class _PaginatedListView extends StatelessWidget {
  const _PaginatedListView({
    Key? key,
    required this.state,
  }) : super(key: key);

  final StarredReposState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.map(
        initial: (s) => 0,
        loadInProgress: (s) => s.repos.entity.length + s.itemsPerPage,
        loadSuccess: (s) => s.repos.entity.length,
        loadFailure: (s) => s.repos.entity.length + 1,
      ),
      itemBuilder: (context, index) {
        return state.map(
          initial: (s) => Container(),
          loadInProgress: (s) {
            if (index < s.repos.entity.length) {
              return RepoTile(repo: s.repos.entity[index]);
            } else {
              return const LoadingRepoTile();
            }
          },
          loadSuccess: (s) => RepoTile(repo: s.repos.entity[index]),
          loadFailure: (s) {
            if (index < s.repos.entity.length) {
              return RepoTile(repo: s.repos.entity[index]);
            } else {
              return FailureRepoTile(failure: s.failure);
            }
          },
        );
      },
    );
  }
}
