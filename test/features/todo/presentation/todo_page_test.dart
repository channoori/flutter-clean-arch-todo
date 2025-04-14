import 'package:clean_architecture_template/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_template/features/todo/presentation/providers/todo_provider.dart';
import 'package:clean_architecture_template/features/todo/presentation/view/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeTodoNotifier extends TodoStateNotifier {
  final List<Todo> _todos;

  FakeTodoNotifier(this._todos);

  @override
  Future<List<Todo>> build() async => _todos;
}

void main() {
  testWidgets('TodoPage renders todos', (WidgetTester tester) async {
    final testTodos = [
      const Todo(id: '1', title: 'test 1'),
      const Todo(id: '1', title: 'test 2'),
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          todoStateProvider.overrideWith(() => FakeTodoNotifier(testTodos)),
        ],
        child: const MaterialApp(home: TodoPage()),
      ),
    );

    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    expect(find.text('test 1'), findsOneWidget);
    expect(find.text('test 2'), findsOneWidget);
    expect(find.byType(Checkbox), findsNWidgets(2));
  });
}
