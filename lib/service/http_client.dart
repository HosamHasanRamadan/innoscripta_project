import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_project/config/constants.dart';

final httpClientProvider = Provider((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: {'Authorization': 'Bearer ${Constants.apiKey}'},
    ),
  );
  return dio;
});
