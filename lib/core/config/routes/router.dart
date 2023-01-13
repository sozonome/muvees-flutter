import 'package:go_router/go_router.dart';
import 'package:muvees/core/config/routes/routes.dart';
import 'package:muvees/core/constants/navigator_key.dart';
import 'package:muvees/ui/pages/home_page.dart';
import 'package:muvees/ui/pages/movie_detail_page.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    routes: <GoRoute>[
      GoRoute(
        name: AppRoute.home,
        path: AppRoute.home,
        builder: (_, GoRouterState state) {
          final MyHomePageParams arguments = state.extra is MyHomePageParams
              ? state.extra as MyHomePageParams
              : const MyHomePageParams();
          return MyHomePage(params: arguments);
        },
      ),
      GoRoute(
        name: AppRoute.movieDetail,
        path: AppRoute.movieDetail,
        builder: (_, GoRouterState state) {
          final MovieDetailPageParams arguments = state.extra is MovieDetailPageParams
              ? state.extra as MovieDetailPageParams
              : const MovieDetailPageParams();
          return MovieDetailPage(params: arguments);
        },
      )
    ],
  );

  static GoRouter get router => _router;
}
