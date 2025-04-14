import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/injectable.dart';
import 'add_todo.dart';
import 'get_todos.dart';
import 'remove_todo.dart';
import 'toggle_todo.dart';

final getTodosProvider = Provider((_) => getIt<GetTodos>());

final addTodoProvider = Provider((_) => getIt<AddTodo>());

final removeTodoProvider = Provider((_) => getIt<RemoveTodo>());

final toggleTodoProvider = Provider((_) => getIt<ToggleTodo>());
