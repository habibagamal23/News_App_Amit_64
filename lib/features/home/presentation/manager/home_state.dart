part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeSuccess extends HomeState {
  List<ArticleModel> articleList;
  HomeSuccess(this.articleList);
}
final class HomeError extends HomeState {
  String error;
  HomeError(this.error);
}
