import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_project/data/project.dart';
import 'package:innoscripta_project/repository/project_repository.dart';

final projectsViewModelProvider =
    AsyncNotifierProvider<ProjectsViewModel, List<Project>>(
  ProjectsViewModel.new,
);

class ProjectsViewModel extends AsyncNotifier<List<Project>> {
  late ProjectRepository _projectRepository;

  var _projects = <Project>[];

  @override
  FutureOr<List<Project>> build() async {
    _projectRepository = ref.watch(projectRepositoryProvider);

    final projects = await _projectRepository.getProjects();
    _projects = projects;
    return _projects;
  }

  Future<bool> refresh() async {
    final result = await AsyncValue.guard(
      () => _projectRepository.getProjects(),
    );
    if (result.valueOrNull == null) return false;
    _projects = result.requireValue;
    state = result;
    return true;
  }

  Future<bool> createProject({
    required String name,
  }) async {
    final newProject = await _projectRepository.createProject(name);
    _projects = [
      ..._projects,
      newProject,
    ];
    state = AsyncValue.data(_projects);
    return true;
  }

  Future<bool> deleteProject({
    required String id,
    int? index,
  }) async {
    final oldList = _projects;
    final newList = [..._projects];
    if (index != null) {
      newList.removeAt(index);
    } else {
      newList.removeWhere((element) => element.id == id);
    }

    _projects = newList;
    state = AsyncValue.data(_projects);
    final isOk = await _projectRepository.deleteProject(id);

    if (isOk) return true;

    _projects = oldList;
    state = AsyncValue.data(_projects);
    return false;
  }
}
