import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_project/config/constants.dart';
import 'package:innoscripta_project/data/comment.dart';
import 'package:innoscripta_project/service/http_client.dart';

final commentRepositoryProvider =
    Provider((ref) => CommentRepository(ref.watch(httpClientProvider)));

class CommentRepository {
  final Dio httpClient;

  CommentRepository(this.httpClient);
  Future<List<Comment>> getComments({
    required String taskId,
  }) async {
    final path = Uri(
      path: '${Constants.apiV2Path}/comments',
      queryParameters: {
        'task_id': taskId,
      },
    );

    final result = await httpClient.getUri<List>(path);

    return Comment.fromList(result.data!.cast<Map<String, dynamic>>());
  }

  Future<Comment> createComment({
    required String taskId,
    required String content,
  }) async {
    final path = Uri(
      path: '${Constants.apiV2Path}/comments',
      queryParameters: {
        'task_id': taskId,
        'content': content,
      },
    );

    final result = await httpClient.postUri<Map>(path);

    return Comment.fromMap(result.data!.cast<String, dynamic>());
  }
}
