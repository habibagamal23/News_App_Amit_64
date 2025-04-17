import 'package:fibo_ecco64/features/home/presentation/pages/DeatilesScreen.dart';
import 'package:fibo_ecco64/features/home/presentation/pages/homeScreen.dart';
import 'package:fibo_ecco64/features/search/presentation/pages/SearchScreen.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/models/ArticleModel.dart';

class AppRouter {
  static const String home = "/home";
  static const String detailes = "/detailes";
  static const String search = "/search";

  static final GoRouter router = GoRouter(initialLocation: home, routes: [
    GoRoute(
        path: home,
        builder: (context, state) {
          return Homescreen();
        }),
    GoRoute(
        path: detailes,
        builder: (context, state) {
          ArticleModel articleModel = state.extra as ArticleModel;
          return Deatilesscreen(articleModel: articleModel);
        }),
    GoRoute(
        path: search,
        builder: (context, state) {
          return Searchscreen();
        })
  ]);
}
