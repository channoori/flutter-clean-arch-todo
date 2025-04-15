import 'package:clean_architecture_template/features/todo/domain/entities/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final testTodoStateProvider = AsyncNotifierProvider<AsyncNotifier<List<Todo>>, List<Todo>>(
  () => throw UnimplementedError('overrideWith로 반드시 덮어써야 합니다.'),
);
