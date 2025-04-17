part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  List<ArticleModel> articleList;
  SearchSuccess(this.articleList);
}

final class SearchError extends SearchState {
  String error;
  SearchError(this.error);
}
