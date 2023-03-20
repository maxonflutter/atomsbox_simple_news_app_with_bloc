part of 'news_details_bloc.dart';

abstract class NewsDetailsEvent extends Equatable {
  const NewsDetailsEvent();

  @override
  List<Object> get props => [];
}

class NewsDetailsStarted extends NewsDetailsEvent {
  final String articleId;

  const NewsDetailsStarted(this.articleId);

  @override
  List<Object> get props => [articleId];
}
