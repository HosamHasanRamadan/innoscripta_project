// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

import 'data/command/command.dart' as p0;
import 'data/command/command_args.dart' as p1;
import 'data/command/command_result.dart' as p2;
import 'data/comment.dart' as p3;
import 'data/completed_task.dart' as p4;
import 'data/project.dart' as p5;
import 'data/project_color.dart' as p6;
import 'data/section.dart' as p7;
import 'data/task.dart' as p8;
import 'data/trackable_completed_task.dart' as p9;
import 'data/trackable_task.dart' as p10;
import 'data/tracking_data.dart' as p11;
import 'view_model.dart/task_view_model/task_view_model.dart' as p12;

void initializeMappers() {
  p0.CommandMapper.ensureInitialized();
  p0.CommandTypeMapper.ensureInitialized();
  p1.CommandArgsMapper.ensureInitialized();
  p1.ProjectAddCommandArgsMapper.ensureInitialized();
  p1.SectionAddCommandArgsMapper.ensureInitialized();
  p1.ItemReorderCommandItemPayloadMapper.ensureInitialized();
  p1.ItemReorderCommandArgsMapper.ensureInitialized();
  p1.ItemMoveCommandArgsMapper.ensureInitialized();
  p1.ItemAddCommandArgsMapper.ensureInitialized();
  p2.CommandResultMapper.ensureInitialized();
  p3.CommentMapper.ensureInitialized();
  p4.CompletedTaskMapper.ensureInitialized();
  p5.ProjectMapper.ensureInitialized();
  p6.ProjectColorMapper.ensureInitialized();
  p7.SectionMapper.ensureInitialized();
  p8.TaskMapper.ensureInitialized();
  p9.TrackableCompletedTaskMapper.ensureInitialized();
  p10.TrackableTaskMapper.ensureInitialized();
  p11.TrackingDataMapper.ensureInitialized();
  p12.TaskWithCommentsMapper.ensureInitialized();
}
