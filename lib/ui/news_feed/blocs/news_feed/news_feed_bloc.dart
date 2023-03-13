import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/models.dart';
import '../../../../repositories/repositories.dart';

part 'news_feed_event.dart';
part 'news_feed_state.dart';

class NewsFeedBloc extends Bloc<NewsFeedEvent, NewsFeedState> {
  final NewsRepository _newsRepository;

  NewsFeedBloc({
    required NewsRepository newsRepository,
  })  : _newsRepository = newsRepository,
        super(const NewsFeedState()) {
    on<NewsFeedStarted>(_onNewsFeedStarted);
  }

  void _onNewsFeedStarted(
    NewsFeedStarted event,
    Emitter<NewsFeedState> emit,
  ) async {
    try {
      List<Article> popularArticles =
          await _newsRepository.getPopularArticles();

      List<Article> breakingNewsArticles =
          await _newsRepository.getBreakingNewsArticles();

      emit(
        state.copyWith(
          popularArticles: popularArticles,
          breakingNewsArticles: breakingNewsArticles,
          status: NewsFeedStatus.loaded,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: NewsFeedStatus.error));
    }
  }
}
