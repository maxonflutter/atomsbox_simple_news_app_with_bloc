import 'package:flutter_test/flutter_test.dart';
import 'package:atomsbox_simple_news_app_with_bloc/models/models.dart';
import 'package:atomsbox_simple_news_app_with_bloc/ui/news_category/blocs/news_category/news_category_bloc.dart';

void main() {
  group('NewsCategoryState', () {
    group('NewsCategoryState, initial', () {
      const mockStatus = NewsCategoryStatus.initial;
      const mockCategory = null;
      const mockArticles = <Article>[];

      NewsCategoryState createSubject() {
        return const NewsCategoryState(status: mockStatus);
      }

      test('supports value equality', () {
        expect(
          createSubject(),
          equals(createSubject()),
        );
      });

      test('props are correct', () {
        expect(
          createSubject().props,
          equals(<Object?>[mockStatus, mockCategory, mockArticles]),
        );
      });
    });

    group('NewsCategoryState, loaded', () {
      const mockStatus = NewsCategoryStatus.initial;
      const mockCategory = NewsCategory.economy;

      const mockArticle1 = Article(
        id: 'id',
        author: Author.empty,
        headline: 'headline',
        leadParagraph: 'leadParagraph',
        supportingParagraph: ['supportingParagraph'],
        imageUrl: 'imageUrl',
        category: NewsCategory.politics,
      );

      const mockArticle2 = Article(
        id: 'id',
        author: Author.empty,
        headline: 'headline',
        leadParagraph: 'leadParagraph',
        supportingParagraph: ['supportingParagraph'],
        imageUrl: 'imageUrl',
        category: NewsCategory.economy,
      );

      final mockArticles = [mockArticle1, mockArticle2]
          .where((article) => article.category == mockCategory)
          .toList();

      NewsCategoryState createSubject() {
        return NewsCategoryState(
          status: mockStatus,
          category: mockCategory,
          articles: mockArticles,
        );
      }

      test('supports value equality', () {
        expect(
          createSubject(),
          equals(createSubject()),
        );
      });

      test('props are correct', () {
        expect(
          createSubject().props,
          equals(<Object?>[mockStatus, mockCategory, mockArticles]),
        );
      });

      test(
          'returns object with an updated category and list of articles with copyWith',
          () {
        expect(
          createSubject().copyWith(
            category: NewsCategory.politics,
            articles: [mockArticle1],
          ),
          const NewsCategoryState(
            status: mockStatus,
            category: NewsCategory.politics,
            articles: [mockArticle1],
          ),
        );
      });
    });
  });
}
