import 'package:clean_architecture_template/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_template/features/todo/presentation/providers/todo_provider.dart';
import 'package:clean_architecture_template/features/todo/presentation/view/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('로딩 상태에서는 CircularProgressIndicator가 보여야 한다', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          todoStateProvider.overrideWith(() => _LoadingTestNotifier()),
        ],
        child: const MaterialApp(home: TodoPage()),
      ),
    );

    // 초기 상태 확인
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('에러 상태에서는 에러 메시지가 보여야 한다.', (tester) async {
    final notifier = _ErrorTestNotifier();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          todoStateProvider.overrideWith(() => notifier),
        ],
        child: const MaterialApp(home: TodoPage()),
      ),
    );

    // build가 완료될 때까지 기다립니다
    await tester.pump();

    // 에러 상태를 명시적으로 설정합니다
    await notifier.setError();

    // 상태 업데이트를 기다립니다
    await tester.pumpAndSettle();

    // 에러 메시지를 찾습니다
    expect(find.byType(Center), findsWidgets);
    expect(find.textContaining('Error:'), findsOneWidget);
  });
}

class _LoadingTestNotifier extends TodoStateNotifier {
  @override
  Future<List<Todo>> build() async {
    state = const AsyncLoading();
    return [];
  }

  @override
  Future<void> add(String title) async {}

  @override
  Future<void> remove(String id) async {}

  @override
  Future<void> toggle(String id, bool current) async {}
}

class _ErrorTestNotifier extends TodoStateNotifier {
  @override
  Future<List<Todo>> build() async {
    return [];
  }

  Future<void> setError() async {
    state = AsyncError('에러가 발생했습니다', StackTrace.current);
  }

  @override
  Future<void> add(String title) async {}

  @override
  Future<void> remove(String id) async {}

  @override
  Future<void> toggle(String id, bool current) async {}
}
