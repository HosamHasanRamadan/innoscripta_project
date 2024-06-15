import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_project/infinite_list/infinite_list_view.dart';
import 'package:innoscripta_project/util/context_x.dart';
import 'package:innoscripta_project/view_model.dart/completed_tasks_view_model.dart';
import 'package:intl/intl.dart';

class CompletedTasksPage extends StatefulWidget {
  final String projectId;
  const CompletedTasksPage({
    super.key,
    required this.projectId,
  });

  @override
  State<CompletedTasksPage> createState() => _CompletedTasksPageState();
}

class _CompletedTasksPageState extends State<CompletedTasksPage> {
  @override
  void initState() {
    super.initState();
    container.read(completedTasksViewModelProvider(widget.projectId)).init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final vm = ref.watch(completedTasksViewModelProvider(widget.projectId));
        return Scaffold(
          appBar: AppBar(title: const Text('Completed Tasks')),
          body: InfiniteListView(
            viewModel: vm,
            itemBuilder: (context, index) {
              final trackableTask = vm.state.items[index];
              return ListTile(
                title: Text(trackableTask.task.content),
                subtitle: trackableTask.trackingData.durationSpentInSec == 0
                    ? null
                    : Text(
                        'Duration:\n${prettyDuration(
                          Duration(
                            seconds:
                                trackableTask.trackingData.durationSpentInSec,
                          ),
                          abbreviated: true,
                        )}',
                      ),
                trailing: Text(
                  'Completed at\n${DateFormat.yMMMEd().format(trackableTask.task.completedAt.toLocal())}',
                ),
              );
            },
          ),
        );
      },
    );
  }
}
