import 'package:injectable/injectable.dart';

import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

@injectable
class AddTodo {
  final TodoRepository repository;

  AddTodo(this.repository);

  Future<void> call(Todo todo) => repository.addTodo(todo);
}
