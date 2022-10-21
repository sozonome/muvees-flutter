import 'package:go_router/go_router.dart';
import 'package:muvees/config/routes/routes.dart';
import 'package:muvees/views/home_page.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: AppRoute.home,
        builder: (_, GoRouterState state) => MyHomePage(title: 'muvees'),
      ),
    ],
  );

  static GoRouter get router => _router;
}
