import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:clean_architecture_template/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_template/features/todo/domain/repositories/todo_repository.dart';
import 'package:clean_architecture_template/features/todo/domain/usecases/get_todos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late MockTodoRepository mockRepo;
  late GetTodos usecase;

  setUp(() {
    mockRepo = MockTodoRepository();
    usecase = GetTodos(mockRepo);
  });

  test('', () async {
    final testTodos = [
      const Todo(id: '1', title: 'Test 1'),
      const Todo(id: '2', title: 'Test 2'),
    ];

    when(() => mockRepo.getTodos()).thenAnswer((_) async => testTodos);

    final result = await usecase();

    expect(result, testTodos);
    verify(() => mockRepo.getTodos()).called(1);
    verifyNoMoreInteractions(mockRepo);
  });
}
