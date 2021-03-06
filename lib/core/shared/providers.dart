import 'package:dio/dio.dart';
import 'package:github_view/core/infrastructure/sembast_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sembastprovider = Provider((ref) => SembastDatabase());

final dioProvider = Provider((ref) => Dio());