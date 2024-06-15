import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension BuildContextX on BuildContext {
  ProviderContainer get container => ProviderScope.containerOf(
        this,
        listen: false,
      );
}

extension StateX<T extends StatefulWidget> on State<T> {
  ProviderContainer get container => ProviderScope.containerOf(
        context,
        listen: false,
      );
}
