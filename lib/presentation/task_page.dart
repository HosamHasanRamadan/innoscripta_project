import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_project/util/context_x.dart';
import 'package:innoscripta_project/view_model.dart/task_view_model/task_view_model.dart';
import 'package:timeago_flutter/timeago_flutter.dart';

class TaskPage extends StatefulWidget {
  final String taskId;
  const TaskPage({
    super.key,
    required this.taskId,
  });

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final contentController = TextEditingController();
  final descriptionController = TextEditingController();
  final contentFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final form = GlobalKey<FormState>();
  late final ProviderSubscription sub;
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    sub = container.listen<AsyncValue<TaskWithComments>>(
      taskViewModelProvider(widget.taskId),
      (previous, next) {
        if (previous is! AsyncData && next is AsyncData) {
          contentController.text = next.requireValue.trackableTask.task.content;
          descriptionController.text =
              next.requireValue.trackableTask.task.description ?? '';
        }
      },
    );
  }

  @override
  void dispose() {
    contentController.dispose();
    descriptionController.dispose();
    contentFocusNode.dispose();
    descriptionFocusNode.dispose();
    sub.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final taskResult = ref.watch(taskViewModelProvider(widget.taskId));
        final controller =
            ref.watch(taskViewModelProvider(widget.taskId).notifier);
        return taskResult.when(
          data: (data) {
            return Scaffold(
              appBar: AppBar(
                title: Text(data.trackableTask.task.content),
                actions: [
                  if (isEditMode == false)
                    IconButton(
                      onPressed: () {
                        isEditMode = true;
                        contentFocusNode.requestFocus();
                        setState(() {});
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  if (isEditMode) ...[
                    IconButton(
                      onPressed: () {
                        final isValid = form.currentState?.validate();
                        if (isValid == false) return;
                        controller.updateTask(
                          content: contentController.text,
                          description: descriptionController.text,
                        );

                        FocusManager.instance.primaryFocus?.unfocus();
                        isEditMode = false;
                        setState(() {});
                      },
                      icon: const Icon(Icons.save),
                    ),
                    IconButton(
                      onPressed: () {
                        isEditMode = false;
                        contentController.text =
                            data.trackableTask.task.content;
                        descriptionController.text =
                            data.trackableTask.task.description ?? '';
                        FocusManager.instance.primaryFocus?.unfocus();
                        setState(() {});
                      },
                      icon: const Icon(Icons.cancel),
                    ),
                  ],
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return CommentDialog(
                            onComment: (value) {
                              controller.comment(
                                value,
                              );
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.comment),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              focusNode: contentFocusNode,
                              controller: contentController,
                              style: Theme.of(context).textTheme.titleLarge,
                              readOnly: isEditMode == false,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'required';
                                return null;
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              focusNode: descriptionFocusNode,
                              controller: descriptionController,
                              readOnly: isEditMode == false,
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                hintText: 'description',
                                border: InputBorder.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: data.comments.isEmpty
                            ? const Center(
                                child: Text('No Comments'),
                              )
                            : Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Comments',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: data.comments.length,
                                      itemBuilder: (context, index) {
                                        final comment = data.comments[index];
                                        return ListTile(
                                          key: ValueKey(comment.id),
                                          title: Text(comment.content),
                                          subtitle: Timeago(
                                            date: comment.postedAt,
                                            builder: (context, value) {
                                              return Text(value);
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => Scaffold(
            body: Center(
              child: TextButton.icon(
                onPressed: () {
                  ref.refresh(taskViewModelProvider(widget.taskId));
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reload'),
              ),
            ),
          ),
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}

class CommentDialog extends StatefulWidget {
  final ValueChanged<String>? onComment;
  const CommentDialog({
    super.key,
    this.onComment,
  });

  @override
  State<CommentDialog> createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Comment'),
      content: TextField(
        autofocus: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Comment'),
        ),
        controller: controller,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (controller.text.isEmpty) return;
            widget.onComment?.call(controller.text);
          },
          child: Text('Commnet'),
        ),
      ],
    );
  }
}
