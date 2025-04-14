import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../domain/entities/todo.dart';
import '../domain/usecases/add_todo.dart';
import '../domain/usecases/get_todos.dart';
import '../domain/usecases/remove_todo.dart';
import '../domain/usecases/toggle_todo.dart';
import '../domain/usecases/toso_usecase_providers.dart';

@injectable
class TodoController {
  final GetTodos _getTodos;
  final AddTodo _addTodo;
  final RemoveTodo _removeTodo;
  final ToggleTodo _toggleTodo;

  TodoController(
    this._getTodos,
    this._addTodo,
    this._removeTodo,
    this._toggleTodo,
  );

  Future<List<Todo>> getTodos() => _getTodos();

  Future<void> add(String title) async {
    final newTodo = Todo(id: '', title: title);
    await _addTodo(newTodo);
  }

  Future<void> remove(String id) async {
    await _removeTodo(id);
  }

  Future<void> toggle(String id, bool currentState) async {
    await _toggleTodo(id, currentState);
  }
}
