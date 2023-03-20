part of 'news_details_bloc.dart';

enum NewsDetailsStatus { initial, loading, loaded, error }

class NewsDetailsState extends Equatable {
  final NewsDetailsStatus status;
  final Article article;

  const NewsDetailsState({
    this.status = NewsDetailsStatus.initial,
    this.article = Article.empty,
  });

  NewsDetailsState copyWith({
    NewsDetailsStatus? status,
    Article? article,
  }) {
    return NewsDetailsState(
      status: status ?? this.status,
      article: article ?? this.article,
    );
  }

  @override
  List<Object> get props => [status, article];
}
