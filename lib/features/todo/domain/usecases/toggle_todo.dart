import 'package:injectable/injectable.dart';

import '../repositories/todo_repository.dart';

@injectable
class ToggleTodo {
  final TodoRepository repository;

  ToggleTodo(this.repository);

  Future<void> call(String id, bool currentState) {
    return repository.toggleTodo(id, currentState);
  }
}
