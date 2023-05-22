import 'package:atomsbox_simple_news_app_with_bloc/ui/news_category/blocs/news_category/news_category_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:atomsbox_simple_news_app_with_bloc/models/models.dart';
import 'package:atomsbox_simple_news_app_with_bloc/repositories/repositories.dart';

import 'news_category_bloc_test.mocks.dart';

// class MockNewsRepository extends Mock implements NewsRepository {}

// class FakeArticle extends Fake implements Article {}

@GenerateMocks([NewsRepository, Article])
void main() {
  const mockCategory = NewsCategory.economy;

  late NewsRepository mockNewsRepository;
  late MockArticle mockArticle;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    mockArticle = MockArticle();
  });

  group('NewsCategoryBloc', () {
    NewsCategoryBloc buildBloc() {
      return NewsCategoryBloc(newsRepository: mockNewsRepository);
    }

    setUp(() {
      when(mockNewsRepository.getArticlesByCategory(mockCategory))
          .thenAnswer((_) => Future.value([mockArticle]));

      when(mockArticle.category).thenReturn(mockCategory);
    });

    group('constructor', () {
      test('works properly', () => expect(buildBloc, returnsNormally));

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(NewsCategoryState()),
        );
      });
    });

    group('NewsCategoryBloc, _onNewsCategoryStarted', () {
      blocTest<NewsCategoryBloc, NewsCategoryState>(
        'invoke getArticlesByCategory with correct category',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const NewsCategoryStarted(category: mockCategory),
        ),
        verify: (_) {
          verify(mockNewsRepository.getArticlesByCategory(mockCategory))
              .called(1);
        },
      );

      blocTest<NewsCategoryBloc, NewsCategoryState>(
        'emits two states with updated status and articles',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const NewsCategoryStarted(category: mockCategory),
        ),
        expect: () => [
          const NewsCategoryState(
            category: mockCategory,
            status: NewsCategoryStatus.loading,
          ),
          NewsCategoryState(
            category: mockCategory,
            articles: [mockArticle],
            status: NewsCategoryStatus.loaded,
          ),
        ],
      );

      blocTest<NewsCategoryBloc, NewsCategoryState>(
        'emits two states with statuses [loading, error] if getArticlesByCategory throws',
        build: buildBloc,
        setUp: () {
          when(mockNewsRepository.getArticlesByCategory(mockCategory))
              .thenThrow((_) => Exception());
        },
        act: (bloc) => bloc.add(
          const NewsCategoryStarted(category: mockCategory),
        ),
        expect: () => [
          const NewsCategoryState(
            category: mockCategory,
            status: NewsCategoryStatus.loading,
          ),
          const NewsCategoryState(
            category: mockCategory,
            status: NewsCategoryStatus.error,
          ),
        ],
      );
    });
  });
}
