import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/injectable.dart';
import '../../application/todo_controller.dart';
import '../../domain/entities/todo.dart';

final todoStateProvider = AsyncNotifierProvider<TodoStateNotifier, List<Todo>>(TodoStateNotifier.new);

class TodoStateNotifier extends AsyncNotifier<List<Todo>> {
  late final TodoController _controller;

  @override
  Future<List<Todo>> build() async {
    _controller = getIt<TodoController>();
    return _controller.getTodos();
  }

  Future<void> add(String title) async {
    await _controller.add(title);
    state = AsyncData(await _controller.getTodos());
  }

  Future<void> remove(String id) async {
    await _controller.remove(id);
    state = AsyncData(await _controller.getTodos());
  }

  Future<void> toggle(String id, bool currentState) async {
    await _controller.toggle(id, currentState);
    state = AsyncData(await _controller.getTodos());
  }
}
