import 'package:clean_architecture_template/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_template/features/todo/presentation/providers/todo_provider.dart';
import 'package:clean_architecture_template/features/todo/presentation/view/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _DeletableTestNotifier extends TodoStateNotifier {
  final List<Todo> _todos;

  _DeletableTestNotifier(this._todos);

  @override
  Future<List<Todo>> build() async => _todos;

  @override
  Future<void> add(String title) async {}

  @override
  Future<void> remove(String id) async {
    state = const AsyncLoading();
    _todos.removeWhere((todo) => todo.id == id);
    state = AsyncData(_todos);
  }

  @override
  Future<void> toggle(String id, bool current) async {}
}

void main() {
  testWidgets('삭제 버튼 클릭 시 해당 Todo가 리스트에서 제거된다.', (tester) async {
    final initialTodos = [
      Todo(id: '1', title: '할 일 1'),
      Todo(id: '2', title: '할 일 2'),
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          todoStateProvider.overrideWith(() => _DeletableTestNotifier(initialTodos)),
        ],
        child: const MaterialApp(home: TodoPage()),
      ),
    );

    await tester.pumpAndSettle();

    // 삭제 버튼 찾기
    final deleteButton = find.descendant(
      of: find.byType(ListTile).first,
      matching: find.byIcon(Icons.delete_outline),
    );

    expect(deleteButton, findsOneWidget);

    await tester.tap(deleteButton);
    await tester.pumpAndSettle();

    expect(find.text('할 일 1'), findsNothing);
    expect(find.text('할 일 2'), findsOneWidget);
  });
}
