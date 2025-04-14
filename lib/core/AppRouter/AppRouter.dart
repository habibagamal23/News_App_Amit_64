import 'package:fibo_ecco64/features/home/presentation/pages/homeScreen.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/models/ArticleModel.dart';

class AppRouter {
  static const String details = "/details";
  static const String home = "/home";

  static final GoRouter router = GoRouter(initialLocation: home, routes: [
    GoRoute(
        path: home,
        builder: (context, state) {
          return Homescreen();
        }),
  ]);
}
