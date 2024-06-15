import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_project/data/trackable_completed_task.dart';
import 'package:innoscripta_project/infinite_list/infinite_list_view_model.dart';
import 'package:innoscripta_project/repository/task_repository.dart';

final completedTasksViewModelProvider = Provider.family.autoDispose(
  (ref, String id) {
    final vm = CompletedTasksViewModel(
      taskRepository: ref.watch(taskRepositoryProvider),
      id: id,
    );
    ref.onDispose(vm.dispose);
    return vm;
  },
);

class CompletedTasksViewModel
    extends InfiniteListViewModel<TrackableCompletedTask> {
  final TaskRepository taskRepository;
  final String id;
  CompletedTasksViewModel({required this.taskRepository, required this.id});
  @override
  Future<List<TrackableCompletedTask>> fetchData(
    int pageNumber,
    int pageSize,
  ) {
    return taskRepository.getCompletedTasks(
      projectId: id,
      pageNumber: pageNumber,
      pageSize: pageSize,
    );
  }
}
