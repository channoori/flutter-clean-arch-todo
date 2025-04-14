// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architecture_template/core/di/di_module.dart' as _i277;
import 'package:clean_architecture_template/features/todo/application/todo_controller.dart'
    as _i820;
import 'package:clean_architecture_template/features/todo/data/datasources/todo_remote_datasource.dart'
    as _i946;
import 'package:clean_architecture_template/features/todo/data/repositories/todo_repository_impl.dart'
    as _i516;
import 'package:clean_architecture_template/features/todo/domain/repositories/todo_repository.dart'
    as _i352;
import 'package:clean_architecture_template/features/todo/domain/usecases/add_todo.dart'
    as _i895;
import 'package:clean_architecture_template/features/todo/domain/usecases/get_todos.dart'
    as _i544;
import 'package:clean_architecture_template/features/todo/domain/usecases/remove_todo.dart'
    as _i726;
import 'package:clean_architecture_template/features/todo/domain/usecases/toggle_todo.dart'
    as _i894;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dIModule = _$DIModule();
    gh.lazySingleton<_i454.SupabaseClient>(() => dIModule.supabaseClient);
    gh.lazySingleton<_i352.TodoRepository>(
        () => _i516.TodoRepositoryImpl(gh<_i946.TodoRemoteDataSource>()));
    gh.factory<_i895.AddTodo>(() => _i895.AddTodo(gh<_i352.TodoRepository>()));
    gh.factory<_i726.RemoveTodo>(
        () => _i726.RemoveTodo(gh<_i352.TodoRepository>()));
    gh.factory<_i894.ToggleTodo>(
        () => _i894.ToggleTodo(gh<_i352.TodoRepository>()));
    gh.factory<_i544.GetTodos>(
        () => _i544.GetTodos(gh<_i352.TodoRepository>()));
    gh.factory<_i820.TodoController>(() => _i820.TodoController(
          gh<_i544.GetTodos>(),
          gh<_i895.AddTodo>(),
          gh<_i726.RemoveTodo>(),
          gh<_i894.ToggleTodo>(),
        ));
    return this;
  }
}

class _$DIModule extends _i277.DIModule {}
