import 'package:injectable/injectable.dart';

import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_remote_datasource.dart';

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remote;

  TodoRepositoryImpl(this.remote);

  @override
  Future<void> addTodo(Todo todo) async {
    remote.addTodo(todo.title);
  }

  @override
  Future<List<Todo>> getTodos() async {
    return remote.getTodos();
  }

  @override
  Future<void> removeTodo(String id) async {
    remote.removeTodo(id);
  }

  @override
  Future<void> toggleTodo(String id, bool currentState) async {
    remote.toggleTodo(id, currentState);
  }
}
