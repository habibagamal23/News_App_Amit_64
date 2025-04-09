import 'package:fibo_ecco64/features/home/presentation/pages/homeScreen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String splash = "/splash";
  static const String home = "/home";

  static final GoRouter router = GoRouter(initialLocation: home, routes: [
    GoRoute(
        path: home,
        builder: (context, state) {
          return Homescreen();
        })
  ]);
}
