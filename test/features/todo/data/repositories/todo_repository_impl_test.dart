import 'package:clean_architecture_template/features/todo/data/datasources/todo_remote_datasource.dart';
import 'package:clean_architecture_template/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:clean_architecture_template/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_template/features/todo/domain/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockTodoRemoteDataSource extends Mock implements TodoRemoteDataSource {}

void main() {
  late MockTodoRemoteDataSource mockRemote;
  late TodoRepository repository;

  setUp(() {
    mockRemote = MockTodoRemoteDataSource();
    repository = TodoRepositoryImpl(mockRemote);
  });

  test('should call addTodo on remote data source', () async {
    // arrange
    const todo = Todo(id: '', title: 'Integration Test');
    when(() => mockRemote.addTodo(todo.title)).thenAnswer((_) async {});

    // act
    await repository.addTodo(todo);

    // assert
    verify(() => mockRemote.addTodo(todo.title)).called(1);
  });
}
