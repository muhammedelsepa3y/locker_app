import 'package:go_router/go_router.dart';

import '../../locker/presentation/screens/home_screen/home_screen.dart';
import 'route_constants.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: homeRoute,
    routes: <RouteBase>[
      GoRoute(
        path: homeRoute,
        builder: (__, _) => const HomeScreen(),
      ),

    ],
  );
}
