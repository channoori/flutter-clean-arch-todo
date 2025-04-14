import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/common/presentation/not_found_page.dart';
import 'go_router_handler_provider.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final handler = ref.watch(routerHandlerProvider.notifier);

  return GoRouter(
    initialLocation: '/auth',
    refreshListenable: handler,
    redirect: (context, state) => handler.redirectLogic(state),
    routes: handler.routes,
    errorBuilder: (context, state) => const NotFoundPage(),
  );
});
