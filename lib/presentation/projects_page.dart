import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_project/data/project.dart';
import 'package:innoscripta_project/presentation/board_page.dart';
import 'package:innoscripta_project/util/context_x.dart';
import 'package:innoscripta_project/view_model.dart/projects_view_model.dart';
import 'package:innoscripta_project/view_model.dart/theme_view_model.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final projectsResult = ref.watch(projectsViewModelProvider);
        return projectsResult.when(
          data: (data) => onData(data),
          error: (error, stackTrace) => Scaffold(
            body: Center(
              child: TextButton.icon(
                onPressed: () {
                  ref.refresh(projectsViewModelProvider);
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reload'),
              ),
            ),
          ),
          loading: () => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  Widget onData(List<Project> projects) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Projects'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const ColorPickerDialog();
                },
              );
            },
            icon: const Icon(Icons.color_lens),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return const NewProjectDialog();
                },
              );
            },
            icon: const Icon(Icons.add_circle_rounded),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await container.read(projectsViewModelProvider.notifier).refresh();
          return;
        },
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return ListTile(
              key: ValueKey(project.id),
              leading: CircleAvatar(
                backgroundColor: Color(project.color.hex),
              ),
              title: Text(project.name),
              trailing: PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      onTap: () {
                        Future.microtask(() {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text(
                                  'Do you want to delete ${project.name} project ?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    container
                                        .read(
                                            projectsViewModelProvider.notifier)
                                        .deleteProject(
                                          id: project.id,
                                          index: index,
                                        );

                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        });
                      },
                      child: Text('Delete'),
                    ),
                  ];
                },
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return BoardPage(projectId: project.id);
                  },
                ));
              },
            );
          },
        ),
      ),
    );
  }
}

class NewProjectDialog extends StatefulWidget {
  const NewProjectDialog({super.key});

  @override
  State<NewProjectDialog> createState() => _NewProjectDialogState();
}

class _NewProjectDialogState extends State<NewProjectDialog> {
  final controller = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New Project'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              label: Text('Name'),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: _createProject,
          child: isLoading ? const Text('Creating...') : const Text('Create'),
        ),
        TextButton(
          onPressed: () {
            Navigator.maybeOf(context)?.maybePop();
          },
          child: const Text('Cancel'),
        )
      ],
    );
  }

  Future<void> _createProject() async {
    if (isLoading) return;
    if (controller.text.isEmpty) return;
    FocusManager.instance.primaryFocus?.unfocus();
    final container = context.container;
    final navigator = Navigator.maybeOf(context);
    setState(() {
      isLoading = true;
    });
    final isOk = await container
        .read(projectsViewModelProvider.notifier)
        .createProject(name: controller.text);
    if (isOk) {
      navigator?.maybePop();
      return;
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class ColorPickerDialog extends ConsumerWidget {
  const ColorPickerDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(themeViewModelProvider);

    return AlertDialog(
      title: const Text('Select Color'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...AppColor.values.map(
                (e) => GestureDetector(
                  onTap: () {
                    viewModel.color = e;
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: e.value,
                      shape: BoxShape.circle,
                      border: e == viewModel.color
                          ? Border.all(
                              color: Theme.of(context).colorScheme.onBackground,
                              width: 2,
                            )
                          : null,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...ThemeMode.values.map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio(
                        groupValue: viewModel.themeMode,
                        value: e,
                        onChanged: (value) {
                          if (value == null) return;
                          viewModel.themeMode = value;
                        },
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
