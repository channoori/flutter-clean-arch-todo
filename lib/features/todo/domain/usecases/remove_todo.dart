import 'package:injectable/injectable.dart';

import '../repositories/todo_repository.dart';

@injectable
class RemoveTodo {
  final TodoRepository repository;

  RemoveTodo(this.repository);

  Future<void> call(String id) => repository.removeTodo(id);
}
