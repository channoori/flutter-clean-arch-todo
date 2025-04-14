import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/todo.dart';

abstract class TodoRemoteDataSource {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(String title);
  Future<void> removeTodo(String id);
  Future<void> toggleTodo(String id, bool currentState);
}

@LazySingleton(as: TodoRemoteDataSource)
class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final SupabaseClient client;

  TodoRemoteDataSourceImpl(this.client);

  @override
  Future<List<Todo>> getTodos() async {
    final response = await client.from('todos').select().order('created_at', ascending: false);

    return (response as List).map((json) => Todo.fromJson(json)).toList();
  }

  @override
  Future<void> addTodo(String title) async {
    await client.from('todos').insert({'title': title});
  }

  @override
  Future<void> removeTodo(String id) async {
    await client.from('todos').delete().eq('id', id);
  }

  @override
  Future<void> toggleTodo(String id, bool currentState) async {
    await client.from('todos').update({'is_done': !currentState}).eq('id', id);
  }
}
