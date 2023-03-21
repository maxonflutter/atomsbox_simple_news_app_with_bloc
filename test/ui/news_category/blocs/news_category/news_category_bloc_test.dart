import 'package:atomsbox_simple_news_app_with_bloc/ui/news_category/blocs/news_category/news_category_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomsbox_simple_news_app_with_bloc/models/models.dart';
import 'package:atomsbox_simple_news_app_with_bloc/repositories/repositories.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

class FakeArticle extends Fake implements Article {}

void main() {
  const mockCategory = NewsCategory.economy;
  const mockArticles = [];

  group('NewsCategoryBloc', () {
    late NewsRepository newsRepository;

    setUpAll(() {
      registerFallbackValue(FakeTodo());
    });

    setUp(() {
      newsRepository = MockNewsRepository();
      when(
        () => newsRepository.getArticlesByCategory(mockCategory),
      ).thenAnswer((_) => );
      when(
        () => todoRepository.saveTodo(any()),
      ).thenAnswer((_) async {});
    });

    NewsCategoryBloc buildBloc() {
      return NewsCategoryBloc(newsRepository: newsRepository);
    }

    group('constructor', () {
      test('works properly', () => expect(buildBloc, returnsNormally));

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(TodoListLoading()),
        );
      });
    });

    // group('TodoListSubscriptionRequested', () {
    //   blocTest<NewsCategoryBloc, TodoListState>(
    //     'starts listening to repository getTodos stream',
    //     build: buildBloc,
    //     act: (bloc) => bloc.add(TodoListStarted()),
    //     verify: (_) {
    //       verify(() => todoRepository.getTodos()).called(1);
    //     },
    //   );

    //   blocTest<NewsCategoryBloc, TodoListState>(
    //     'emits state with updated status and todos '
    //     'when repository getTodos stream emits new todos',
    //     build: buildBloc,
    //     act: (bloc) => bloc.add(TodoListStarted()),
    //     expect: () => [const TodoListLoaded(mockTodos)],
    //   );
    // });

    // group('TodoListTodoDeleted', () {
    //   blocTest<NewsCategoryBloc, TodoListState>(
    //     'deletes todo using repository',
    //     setUp: () {
    //       when(
    //         () => todoRepository.deleteTodo(any()),
    //       ).thenAnswer((_) async {});
    //     },
    //     build: buildBloc,
    //     seed: () => const TodoListLoaded(mockTodos),
    //     act: (bloc) => bloc.add(TodoListTodoDeleted(mockTodos.first)),
    //     verify: (_) {
    //       verify(
    //         () => todoRepository.deleteTodo(mockTodos.first.id),
    //       ).called(1);
    //     },
    //   );
    // });
  });
}
