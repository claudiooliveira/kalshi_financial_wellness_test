import 'package:go_router/go_router.dart';
import 'package:kalshi_financial_wellness_test/screens/home/home_screen.dart';

final routerConfig = GoRouter(
  initialLocation: HomeScreen.routerPath,
  routes: [
    GoRoute(
      path: HomeScreen.routerPath,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
