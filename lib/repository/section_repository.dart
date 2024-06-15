import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_project/config/constants.dart';
import 'package:innoscripta_project/data/section.dart';
import 'package:innoscripta_project/service/http_client.dart';

final sectionRepositoryProvider = Provider((ref) {
  return SectionRepository(
    ref.watch(httpClientProvider),
  );
});

class SectionRepository {
  final Dio httpClient;

  const SectionRepository(this.httpClient);

  Future<Section> createSection({
    required String projectId,
    required String name,
    int? order,
  }) async {
    const path = '/sections';
    final result = await httpClient.post<Map>(path, data: {
      'name': name,
      'project_id': projectId,
      if (order != null) 'order': order,
    });
    return Section.fromMap(result.data!.cast<String, dynamic>());
  }

  Future<List<Section>> getSections({
    required String projectId,
  }) async {
    final path = Uri(
      path: '${Constants.apiV2Path}/sections',
      queryParameters: {'project_id': projectId},
    );
    final result = await httpClient.getUri<List>(
      path,
    );
    return Section.fromList(result.data!.cast<Map<String, dynamic>>());
  }
}
