import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_project/main.init.dart';
import 'package:innoscripta_project/service/local_storage.dart';

Future<ProviderContainer> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeMappers();
  final localStorage = await LocalStorage.init();
  final container = ProviderContainer(overrides: [
    localStorageProvider.overrideWithValue(localStorage),
  ]);

  return container;
}
