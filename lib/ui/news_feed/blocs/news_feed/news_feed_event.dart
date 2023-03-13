part of 'news_feed_bloc.dart';

abstract class NewsFeedEvent extends Equatable {
  const NewsFeedEvent();

  @override
  List<Object> get props => [];
}

class NewsFeedStarted extends NewsFeedEvent {}
