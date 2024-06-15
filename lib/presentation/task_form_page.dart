import 'package:flutter/material.dart';
import 'package:innoscripta_project/repository/task_repository.dart';
import 'package:innoscripta_project/service/global_event_bus.dart';
import 'package:innoscripta_project/util/context_x.dart';
import 'package:innoscripta_project/util/future_x.dart';

class TaskFormPage extends StatefulWidget {
  final String projectId;
  final String sectionId;

  const TaskFormPage({
    super.key,
    required this.projectId,
    required this.sectionId,
  });

  @override
  State<TaskFormPage> createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  final contentController = TextEditingController();
  final descriptionController = TextEditingController();
  final form = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    contentController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Task'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) return 'required';
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Content*',
                  border: OutlineInputBorder(),
                ),
                controller: contentController,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                child: OutlinedButton(
                  onPressed: isLoading ? null : submit,
                  child:
                      isLoading ? const Text('Saving...') : const Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submit() async {
    final isValid = form.currentState?.validate();
    if (isValid == false) return;
    final taskRepo = container.read(taskRepositoryProvider);
    setState(() {
      isLoading = true;
    });
    final result = await taskRepo
        .createTask(
          projectId: widget.projectId,
          sectionId: widget.sectionId,
          content: contentController.text,
          description: descriptionController.text,
        )
        .result;
    setState(() {
      isLoading = false;
    });
    if (result.isError) return;

    GlobalEventBus.sendEvent(
      name: GlobalEvent.taskAdded.name,
      payload: {'task': result.requireValue},
    );

    Navigator.pop(context);
  }
}
