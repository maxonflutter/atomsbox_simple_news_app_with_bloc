part of 'news_feed_bloc.dart';

enum NewsFeedStatus { initial, loading, loaded, error }

class NewsFeedState extends Equatable {
  final NewsFeedStatus status;
  final List<Article> articles;
  final List<Article> popularArticles;
  final List<Article> breakingNewsArticles;

  const NewsFeedState({
    this.status = NewsFeedStatus.initial,
    this.articles = const <Article>[],
    this.popularArticles = const <Article>[],
    this.breakingNewsArticles = const <Article>[],
  });

  NewsFeedState copyWith({
    NewsFeedStatus? status,
    List<Article>? articles,
    List<Article>? popularArticles,
    List<Article>? breakingNewsArticles,
  }) {
    return NewsFeedState(
      status: status ?? this.status,
      articles: articles ?? this.articles,
      popularArticles: popularArticles ?? this.popularArticles,
      breakingNewsArticles: breakingNewsArticles ?? this.breakingNewsArticles,
    );
  }

  @override
  List<Object> get props => [
        status,
        articles,
        popularArticles,
        breakingNewsArticles,
      ];
}
