import 'package:clean_architecture_template/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_template/features/todo/domain/repositories/todo_repository.dart';
import 'package:clean_architecture_template/features/todo/domain/usecases/add_todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late MockTodoRepository mockRepo;
  late AddTodo usecase;

  setUp(() {
    mockRepo = MockTodoRepository();
    usecase = AddTodo(mockRepo);
  });

  test('should call addTodo on repository with correct data', () async {
    const testTodo = Todo(id: '', title: 'Test Todo');

    when(() => mockRepo.addTodo(testTodo)).thenAnswer((_) async {});

    await usecase(testTodo);

    verify(() => mockRepo.addTodo(testTodo)).called(1);
    verifyNoMoreInteractions(mockRepo);
  });
}
