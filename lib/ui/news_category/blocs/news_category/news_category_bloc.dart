import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/models.dart';
import '../../../../repositories/repositories.dart';

part 'news_category_event.dart';
part 'news_category_state.dart';

class NewsCategoryBloc extends Bloc<NewsCategoryEvent, NewsCategoryState> {
  final NewsRepository _newsRepository;

  NewsCategoryBloc({
    required NewsRepository newsRepository,
  })  : _newsRepository = newsRepository,
        super(const NewsCategoryState()) {
    on<NewsCategoryStarted>(_onNewsCategoryStarted);
  }

  void _onNewsCategoryStarted(
    NewsCategoryStarted event,
    Emitter<NewsCategoryState> emit,
  ) async {
    emit(
      state.copyWith(
        category: event.category,
        status: NewsCategoryStatus.loading,
      ),
    );
    try {
      List<Article> articles =
          await _newsRepository.getArticlesByCategory(event.category);

      emit(
        state.copyWith(
          articles: List.from(state.articles)..addAll(articles),
          category: event.category,
          status: NewsCategoryStatus.loaded,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: NewsCategoryStatus.error));
    }
  }
}
