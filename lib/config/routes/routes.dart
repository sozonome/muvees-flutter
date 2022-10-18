import 'package:go_router/go_router.dart';
import 'package:muvees/views/home_page.dart';

class AppRoute {
  static const home = '/';
}

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: AppRoute.home,
        builder: (_, GoRouterState state) => MyHomePage(title: 'Rest'),
      ),
    ],
  );

  static GoRouter get router => _router;
}
