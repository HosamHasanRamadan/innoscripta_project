import 'package:async/async.dart';

extension FutureX<T> on Future<T> {
  Future<Result<T>> get result => Result.capture(this);
}

extension ResultX<T> on Result<T> {
  T get requireValue => asValue!.value;
  T? get valueOrNull => asValue?.value;
}
