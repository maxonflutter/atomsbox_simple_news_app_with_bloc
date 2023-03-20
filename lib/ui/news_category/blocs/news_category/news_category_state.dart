part of 'news_category_bloc.dart';

enum NewsCategoryStatus { initial, loading, loaded, error }

class NewsCategoryState extends Equatable {
  final NewsCategoryStatus status;
  final NewsCategory? category;
  final List<Article> articles;

  const NewsCategoryState({
    this.status = NewsCategoryStatus.initial,
    this.category,
    this.articles = const <Article>[],
  });

  NewsCategoryState copyWith({
    NewsCategoryStatus? status,
    NewsCategory? category,
    List<Article>? articles,
  }) {
    return NewsCategoryState(
      status: status ?? this.status,
      category: category ?? this.category,
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object?> get props => [status, category, articles];
}
