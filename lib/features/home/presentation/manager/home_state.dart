part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<Articles> articles;
  HomeSuccess(this.articles);
}

final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
