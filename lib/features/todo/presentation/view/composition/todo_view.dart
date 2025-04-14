import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/todo.dart';
import '../../providers/todo_provider.dart';

class TodoView extends ConsumerWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoControllerProvider);

    return todos.when(
      data: (list) => _TodoList(list: list),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (e, _) => Center(
        child: Text('Error: $e'),
      ),
    );
  }
}

class _TodoList extends ConsumerWidget {
  final List<Todo> list;

  const _TodoList({
    required this.list,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(todoControllerProvider.notifier);
    final inputController = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: inputController,
                  decoration: const InputDecoration(hintText: 'Add new todo'),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            controller.add(inputController.text.trim());
            inputController.clear();
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              final todo = list[index];
              return ListTile(
                title: Text(
                  todo.title,
                  style: TextStyle(
                    decoration: todo.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                leading: Checkbox(
                  value: todo.isDone,
                  onChanged: (_) => controller.toggle(todo.id, todo.isDone),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                  ),
                  onPressed: () => controller.remove(todo.id),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
