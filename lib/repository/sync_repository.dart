import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_project/config/constants.dart';
import 'package:innoscripta_project/data/command/command.dart';
import 'package:innoscripta_project/data/command/command_result.dart';
import 'package:innoscripta_project/service/http_client.dart';

final syncRepositoryProvider = Provider(
  (ref) => SyncRepository(
    ref.watch(httpClientProvider),
  ),
);

class SyncRepository {
  final Dio httpClient;

  SyncRepository(this.httpClient);

  Future<CommandResult> syncCommands(List<Command> commands) async {
    const path = '${Constants.apiSyncPath}/sync';
    final result = await httpClient.post<Map>(
      path,
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
      data: {
        'commands': commands.encode(),
      },
    );
    return CommandResult.fromMap(result.data!.cast<String, dynamic>());
  }
}
