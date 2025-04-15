import 'package:clean_architecture_template/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_template/features/todo/presentation/providers/todo_provider.dart';
import 'package:clean_architecture_template/features/todo/presentation/view/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fakes/test_todo_provider.dart';

void main() {
  testWidgets('체크박스를 클릭하면 Todo의 완료 상태가 반영된다', (tester) async {
    final Todo todo = Todo(id: '1', title: '공부하기');

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          todoStateProvider.overrideWith(() => _ToggleTestNotifier([todo])),
        ],
        child: MaterialApp(home: TodoPage()),
      ),
    );

    await tester.pumpAndSettle();

    final titleText = find.text('공부하기');
    expect(titleText, findsOneWidget);

    final textWidget = tester.firstWidget<Text>(titleText);
    expect(textWidget.style?.decoration, isNull);

    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    final updatedTextWidget = tester.firstWidget<Text>(titleText);
    expect(updatedTextWidget.style?.decoration, TextDecoration.lineThrough);
  });
}

class _ToggleTestNotifier extends TodoStateNotifier {
  final List<Todo> _todos;

  _ToggleTestNotifier(this._todos);

  @override
  Future<List<Todo>> build() async => _todos;

  @override
  Future<void> add(String title) async {}

  @override
  Future<void> remove(String id) async {}

  @override
  Future<void> toggle(String id, bool current) async {
    final index = _todos.indexWhere((todo) => todo.id == id);
    _todos[index] = _todos[index].copyWith(isDone: !current);
    state = AsyncData([..._todos]);
  }
}
