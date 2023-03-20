part of 'news_category_bloc.dart';

abstract class NewsCategoryEvent extends Equatable {
  const NewsCategoryEvent();

  @override
  List<Object> get props => [];
}

class NewsCategoryStarted extends NewsCategoryEvent {
  final NewsCategory category;

  const NewsCategoryStarted({required this.category});

  @override
  List<Object> get props => [category];
}
