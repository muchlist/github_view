import 'package:flutter/material.dart';
import 'package:github_view/core/presentation/toasts.dart';
import 'package:github_view/github/core/presentation/no_result_display.dart';
import 'package:github_view/github/repos/core/application/paginated_repos_notifier.dart';
import 'package:github_view/github/repos/core/presentation/repo_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'failure_repo_tile.dart';
import 'loading_repo_tile.dart';

class PaginatedReposListView extends StatefulWidget {
  final AutoDisposeStateNotifierProvider<PaginatedReposNotifier,
      PaginatedReposState> paginatedReposNotifierProvider;
  final void Function(WidgetRef ref) getNextPage;
  final String noResultMessage;

  const PaginatedReposListView(
      {Key? key,
      required this.paginatedReposNotifierProvider,
      required this.getNextPage,
      required this.noResultMessage})
      : super(key: key);

  @override
  State<PaginatedReposListView> createState() => _PaginatedReposListViewState();
}

class _PaginatedReposListViewState extends State<PaginatedReposListView> {
  bool canLoadNextPage = false;
  bool hasAlreadyShowNoConnToast = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      ref.listen<PaginatedReposState>(widget.paginatedReposNotifierProvider,
          (previous, next) {
        next.map(
          initial: (s) => canLoadNextPage = true,
          loadInProgress: (s) => canLoadNextPage = false,
          loadSuccess: (s) {
            if (!s.repos.isFresh && !hasAlreadyShowNoConnToast) {
              hasAlreadyShowNoConnToast = true;
              showNoConnetionToast(
                  "You're not online, some information may be outdated.",
                  context);
            }
            canLoadNextPage = s.isNextPageAvailable;
          },
          loadFailure: (s) => canLoadNextPage = false,
        );
      });
      final state = ref.watch(widget.paginatedReposNotifierProvider);
      return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            final metric = notification.metrics;
            final limit = metric.maxScrollExtent - metric.viewportDimension / 3;

            if (canLoadNextPage && metric.pixels >= limit) {
              canLoadNextPage = false;
              widget.getNextPage(ref);
            }

            return false;
          },
          child: state.maybeWhen(
                  loadSuccess: (repos, _) => repos.entity.isEmpty,
                  orElse: () => false)
              ? NoResultsDisplay(
                  message: widget.noResultMessage,
                )
              : _PaginatedListView(state: state));
    }));
  }
}

class _PaginatedListView extends StatelessWidget {
  const _PaginatedListView({
    Key? key,
    required this.state,
  }) : super(key: key);

  final PaginatedReposState state;

  @override
  Widget build(BuildContext context) {
    final fsb = FloatingSearchBar.of(context)?.widget;
    return ListView.builder(
      padding: fsb == null
          ? EdgeInsets.zero
          : EdgeInsets.only(
              top: fsb.height + 8 + MediaQuery.of(context).padding.top),
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
