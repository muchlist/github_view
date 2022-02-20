import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_view/github/core/domain/github_repo.dart';

class RepoDetailPage extends StatefulWidget {
  final GithubRepo repo;

  const RepoDetailPage({
    Key? key,
    required this.repo,
  }) : super(key: key);

  @override
  _RepoDetailPageState createState() => _RepoDetailPageState();
}

class _RepoDetailPageState extends State<RepoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Hero(
            tag: widget.repo.fullName,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage:
                  CachedNetworkImageProvider(widget.repo.owner.avatarUrlSmall),
              radius: 16,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(child: Text(widget.repo.name)),
        ],
      )),
    );
  }
}
