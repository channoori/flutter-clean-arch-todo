import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerHandlerProvider = NotifierProvider<RouterHandler, RouterHandlerState>(
  () => RouterHandler(),
);

class RouterHandlerState {
  const RouterHandlerState();
}

class RouterHandler extends Notifier<RouterHandlerState> implements Listenable {
  final ValueNotifier<bool> _notifier = ValueNotifier(false);

  @override
  void addListener(VoidCallback listener) => _notifier.addListener(listener);

  @override
  void removeListener(VoidCallback listener) => _notifier.removeListener(listener);

  @override
  RouterHandlerState build() => const RouterHandlerState();

  String? redirectLogic(GoRouterState state) {
    final bool loggedIn = false; //TODO: 로그인 상태로 교체
    final bool goingToLogin = state.matchedLocation == '/login';

    if (!loggedIn && !goingToLogin) {
      //TODO: 나중에 routeName으로 변경
      return '/login';
    }

    if (loggedIn && goingToLogin) {
      //TODO: 나중에 routeName을 변경
      return '/home';
    }

    return null;
  }

  List<GoRoute> get routes => [];

  void refresh() {
    _notifier.value = !_notifier.value; // toggle to trigger listener
    state = const RouterHandlerState(); // also update state
  }

  /// 모듈별로 route나누기
  List<GoRoute> authRoutes = [];
}
