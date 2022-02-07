import 'package:flutter/material.dart';
import 'package:github_view/core/presentation/app_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: AppWidget()));
}
