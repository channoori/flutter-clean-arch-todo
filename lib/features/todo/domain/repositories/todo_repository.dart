import '../entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> removeTodo(String id);
  Future<void> toggleTodo(String id, bool currentState);
}
