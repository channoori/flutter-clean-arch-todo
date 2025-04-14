import 'package:clean_architecture_template/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_template/features/todo/presentation/providers/todo_provider.dart';
import 'package:clean_architecture_template/features/todo/presentation/view/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class TestTodoStateNotifier extends TodoStateNotifier {
  final List<Todo> _todos;

  TestTodoStateNotifier(this._todos);

  @override
  Future<List<Todo>> build() async => _todos;

  @override
  Future<void> add(String title) async {
    _todos.add(Todo(id: DateTime.now().toString(), title: title));
    state = AsyncData(List.from(_todos));
  }

  // remove, toggle도 원하면 override
}

void main() {
  testWidgets('입력 후 추가 버튼을 누르면 새로운 Todo가 리스트에 렌더링된다', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          todoStateProvider.overrideWith(() => TestTodoStateNotifier([])),
        ],
        child: const MaterialApp(home: TodoPage()),
      ),
    );

    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    // 1. TextField에 입력
    await tester.enterText(find.byKey(const Key('todo_input')), 'New Task');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // 2. 추가 버튼 탭
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // 다시 렌더링 반영

    // 3. 텍스트가 보이는지 확인
    expect(find.text('New Task'), findsOneWidget);
  });
}
