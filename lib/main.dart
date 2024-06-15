@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library main;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_project/init_app.dart';
import 'package:innoscripta_project/presentation/projects_page.dart';
import 'package:innoscripta_project/view_model.dart/theme_view_model.dart';

Future<void> main() async {
  final container = await initApp();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final theme = ref.watch(themeViewModelProvider);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: theme.themeMode,
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: theme.color.value,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: theme.color.value,
            ),
            useMaterial3: true,
          ),
          home: const ProjectsPage(),
        );
      },
    );
  }
}
